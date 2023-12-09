---
title: Patching
description: How to apply batching to sources when building.
published: true
date: 2023-12-09T14:41:31.283Z
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

Suppose we have the following shell script that we want to package with nix.  This prompts the user with all the `.pdf` files in the current directory, then opens it in zathura.
```sh
f=$(fd . --extension pdf | fzf)
zathura "$f"
```
We can wrap this in a flake using `writeShellApplication` like so.
```nix
{
	outputs = {self, nixpkgs}: let
  	pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.writeShellApplication {
      name = "openpdf";
      runtimeInputs = with pkgs; [fd fzf zathura];
      text = pkgs.lib.readFile ./script.sh;
    };
  };
}
```

## Patching the issue

https://nixos.org/manual/nixpkgs/stable/#ssec-patch-phase

TODO: Currently no issue.  Can't use writeshellapplication since you can't overwrite patches.  Need to use mkderivation directly, or a different helper function. Consider a python application that has a hard-coded path somewhere.  Maybe it calls an external shell script at some fixed path?

If we have access to the source code directly, we can just modify our script.  No issues, no need for patching.

But what if you are packaging some EXTERNAL program?  You can't modify the source code directly.  We will need to apply a patch to modify the source with our fix before building.

Generate a patch using `git diff > change.patch`.  Then add to `patches` attribute.  See now how our python code works.
