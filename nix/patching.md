---
title: Patching
description: How to apply batching to sources when building.
published: true
date: 2023-12-09T17:14:19.941Z
tags: 
editor: markdown
dateCreated: 2023-12-08T23:28:25.525Z
---

# Patches (WIP)
> This page is a draft
{.is-danger}

When packaging external software for nix, we might need to modify the source code directly.  A common use case could be updating links to executables.

In this example, we will show how to generate a patch, and apply it when packaging a shell script for use in nix.

## Package a Python Script

You find a cool script online that you'd like to have in your environment.  It's a python script that shows you all the `pdf` files in the current directory, then prompts the user to pick one, and then opens it in `zathura`.  The script reads as follows.

```python
#!/usr/bin/python3
import subprocess, glob

files = glob.glob("**.pdf")
for i, filename in enumerate(files):
    print(f"{i}: {filename}")

x = int(input("Pick file: "))
subprocess.run(["/usr/bin/zathura", files[x]])
```

The script writer documents how to run it: `python3 openpdf.py`.  You try this for yourself, and it has some issues!  There are dependency issues, so we build a derivation around this.  This can be done easily with `stdenv.mkderivation` as follows.
```nix
{
	outputs = {self, nixpkgs}: let
  	pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDervation {
      name = "openpdf";
      src = ./.;
      runtimeInputs = with pkgs; [python zathura];
      installPhase = ''
        mkdir -p $out/bin
        cp openpdf.py $out/bin/openpdf
        chmod +x $out/bin/openpdf
      '';
    };
  };
}
```

You go to test your flake with `nix run`:
```
$ nix run
0: first.pdf
1: second.pdf
2: third.pdf
Pick file: 1
Traceback (most recent call last):
...
FileNotFoundError: [Errno 2] No such file or directory: '/usr/bin/zathura'
```
Ah!  The creator of the script hard-coded the file path for `zathura`.  We should modify the script to update the path, or better yet, remove it altogether, since we know from `buildInputs` will put `zathura` in our path for us.

## Patching the issue

If we were packaging our own script, we would simply modify the source code ourselves.  But we are trying to package an *external* project.  We could submit a pull request, but that could conflict with maintainer's environments, conflict with existing build tools, or whatever.  We need to modify the source code at build time, to fix this issue.

We can apply a patch during the `patchPhase` of `mkDerivation`.  This will modify the source right after downloading and extracting it, but before we build and install.

### Patch

A patch is a file that describes how to modify an original file to produce a modified file.  We can generate patch files from programs like `diff` and `git diff`.

To start, we need to get access to the source.  Typically the external project is hosted using git, so we clone the repository.  Then we can modify the file we care about.  In our case, `openpdf.py`.  We update the string `/usr/bin/zathura` to just `zathura`.  Then we can run `git diff` and it will produce the following to `stdout`:

```
$ git diff
diff --git a/openpdf.py b/openpdf.py
index 1fa1bb5..778198b 100644
--- a/openpdf.py
+++ b/openpdf.py
@@ -6,4 +6,4 @@ for i, filename in enumerate(files):
     print(f"{i}: {filename}")
 
 x = int(input("Pick file: "))
-subprocess.run(["/usr/bin/zathura", files[x]])
+subprocess.run(["zathura", files[x]]
```

We can redirect this output to a patch file called `zathura.patch`, which describes our changes.
```sh
$ git diff > zathura.patch
```

If we aren't using git, we can make a copy of the source file alongside it.  We call this new file `modified.py`.  We can generate a diff file using `git`.
```
git diff openpdf.py modified.py > zathura.patch
``` 
Or we can use `diff`, which is a 
```
diff --unified openpdf.py modified.py > zathura.patch
```
Now we have a patch file that we can add to our flake.

### Patch Phase

One of the default phases of `mkDerivation` is the [patch phase](https://nixos.org/manual/nixpkgs/stable/#ssec-patch-phase).


TODO: Currently no issue.  Can't use writeshellapplication since you can't overwrite patches.  Need to use mkderivation directly, or a different helper function. Consider a python application that has a hard-coded path somewhere.  Maybe it calls an external shell script at some fixed path?

If we have access to the source code directly, we can just modify our script.  No issues, no need for patching.

But what if you are packaging some EXTERNAL program?  You can't modify the source code directly.  We will need to apply a patch to modify the source with our fix before building.

Generate a patch using `git diff > change.patch`.  Then add to `patches` attribute.  See now how our python code works.
