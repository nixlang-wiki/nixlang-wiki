---
title: Patching
description: How to apply batching to sources when building.
published: true
date: 2023-12-09T17:29:13.547Z
tags: 
editor: markdown
dateCreated: 2023-12-08T23:28:25.525Z
---

# Patches

When packaging external software for nix, we might need to modify the source code directly.  A common use case could be updating links to executables.

In this example, we will show how to generate a patch, and apply it when packaging a python script for use in nix.

## Package a Python Script

You find a useful script on GitHub that you'd like to have in your environment.  It's a python script that shows you all the `pdf` files in the current directory, then prompts the user to pick one, and then opens it in `zathura`.  The script reads as follows.

```python
#!/usr/bin/python3
import subprocess, glob

files = glob.glob("**.pdf")
for i, filename in enumerate(files):
    print(f"{i}: {filename}")

x = int(input("Pick file: "))
subprocess.run(["/usr/bin/zathura", files[x]])
```

We want to use this in our nix environment, so we build a derivation to add this script as an executable in our pathh.  The following flake accomplishes this task using `stdenv.mkderivation`.
```nix
{
  inputs.openpdf.url = "github:bob/openpdf-script";
	outputs = {self, nixpkgs, openpdf}: let
  	pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDervation {
      name = "openpdf";
      src = openpdf;
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

## Patching the Path

If we were building our own script, we would simply modify the source code ourselves.  But we are trying to package an *external* project.  We could submit a pull request, but that could conflict with maintainer's environments, conflict with existing build tools, or just take a long time.  

We need a way to modify the source code at build time without modifying the source code directly.

We can apply a patch during the `patchPhase` of `mkDerivation`.  This will modify the source right after downloading and extracting it, but before we build and install.

### Patch

A patch is a file that describes how to modify an original file to produce a modified file.  We can generate patch files from programs like `git diff`.

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

### Patch Phase

One of the default phases of `mkDerivation` is the [patch phase](https://nixos.org/manual/nixpkgs/stable/#ssec-patch-phase).  All we need to do is add our `zathura.patch` file to the list of `patches` like so.
```
{
	outputs = {self, nixpkgs}: let
  	pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDervation {
      name = "openpdf";
      src = ./.;
      runtimeInputs = with pkgs; [python zathura];
      patches = [ ./zathura.patch ];
      installPhase = ''
        mkdir -p $out/bin
        cp openpdf.py $out/bin/openpdf
        chmod +x $out/bin/openpdf
      '';
    };
  };
}
```

And now our flake will make our change before building and installing.  It works now!

### Shebang

If you noticed from this example, we didn't have to modify the `#!/usr/bin/python3` at the top of the source file.  Well `mkDerivation` handles this for us in the [fixup phase](https://nixos.org/manual/nixpkgs/stable/#ssec-fixup-phase).  It accomplishes this using patching!
