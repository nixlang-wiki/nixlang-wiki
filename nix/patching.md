---
title: Patching
description: How to apply batching to sources when building.
published: true
date: 2023-12-08T23:28:25.525Z
tags: 
editor: markdown
dateCreated: 2023-12-08T23:28:25.525Z
---

# Patches
When packaging external software for nix, we might need to modify the source code directly.  A common use case could be updating links to executables.

In this example, we will show how to generate a patch, and apply it when packaging a shell script for use in nix.

## Package a Shell Script

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

Currently no issue.  Can't use writeshellapplication since you can't overwrite patches.  Need to use mkderivation directly, or a different helper function. Consider a python application that has a hard-coded path somewhere.  Maybe it calls an external shell script at some fixed path?

If we have access to the source code directly, we can just modify our script.  No issues, no need for patching.

But what if you are packaging some EXTERNAL program?  You can't modify the source code directly.  We will need to apply a patch to modify the source with our fix before building.

Generate a patch using `git diff > change.patch`.  Then add to `patches` attribute.  See now how our python code works.
