---
title: Derivation
description: 
published: true
date: 2024-03-31T21:47:54.790Z
tags: 
editor: markdown
dateCreated: 2023-12-10T13:41:43.087Z
---

# Nix Derivations
A derivation is a nix expression that encapsulates how to install a piece of software.

## Derivation Definition
A *derivation* represents the instructions for building some artifact.  This artifact can be an application, a website, or configuration file.  A derivation can describe how a piece of software is built and installed, in the same way a package manager installs packages.  

Technically, a derivation is just an attribute whose attribute `type` has value `"derivation"`.  In practice, a derivation is an attribute set with the following attributes.
```
{
	name = "app";
  system = "x86-64_linux";
  builder = "echo 'building!'";
}
```
The `name` is the name of the derivation.  When this derivation is added to the nix store, `name` will be used as part of the file name.  The system defines which architecture this derivation is created for.  The builder is a script(?) with everything needed to build the software from scratch and install it. 

You will never build derivations from scratch, but it's helpful to understand what a derivation is at the most basic level.

## `derivation` builtin
The standard library has a function `derivation` to build derivations for you.  It take an attribute set as input with `name`, `system`, and `builder` attributes.  We can explore the returned attribute set after calling this function in the nix REPL.
```
> d = derivation {name="app"; system="x86_64-linux"; builder="build.sh";}
> __attrNames d
```

A derivation is a description of how nix will manage the store.  The real work of building and installing software is handled by whatever script is being run with `builder`.  The `builder` attribute can point to an executable for installing the software.  Any arguments needed for run the `builder` executable can optionally be passed in with the `args` attribute.

More attributes are documented in the [NixOS manual page for derivations](https://nixos.org/manual/nix/stable/language/derivations.html).  Also documented is precisely how the builder is executed regarding the nix store, environment variables, and outputs.

It is uncommon you will build a derivation directly from `derivation`.  There are higher levels of abstraction provided by nixpkgs that are more specific to how software is built and installed.

## `mkDerivation` from nixpkgs
Nixpkgs also provides another level of abstraction called `mkDerivation`, which includes a general purpose convention for building and installing software.  It even handles C compilation out of the box, since many applications use `make` for building and install software.

`mkDerivation` is set up using *phases* or list of steps that are typically taken in the build process.  `mkDerivation` allows us to modify phases to fit the needs of whatever software we are building and installing, but without a lot of repeated or basic work, such as uncompressing a `tar` file.

By default nixpkgs uses the following phases:
1. Unpack: uncompressed source code
2. Patch: apply any [patches](/nix/patching)
3. Configure: prepare for building
4. Build: compile or build software
5. Check: run tests to verify successful build
6. Install: moving executable and other runtime resources
7. Fixup: nix-specific postprocessing
8. Install Check: verify successful installation
9. Distribution: produce source distributions

These phases may or may not apply based on the package you building.  For instance, a single python script doesn't need a build step at all.  A static website may not have a test suite to check anything.  But by default `mkDerivation` will try executing a phase if applicable, otherwise it is skipped.

## Language Specific Derivations from nixpkgs
Nixpkgs provides many other wrapper functions on `derivation` specific to each language.  The full list you can find in the source.