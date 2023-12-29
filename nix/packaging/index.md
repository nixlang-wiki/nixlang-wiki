---
title: Packaging things with nix
description: All about how to package different thing using the package manager and build tool
published: true
date: 2023-12-29T14:17:32.125Z
tags: package management, guide
editor: markdown
dateCreated: 2023-12-26T12:08:20.540Z
---

# Packaging things with nix

Nix can be used to build and package software, libraries, files, or just about anything.
Packages in `nix` are also called [derivations](/nix/derivation).

This page will explain the basics of creating a derivation in nix. It's very bare bones as `nix` is written to be able to package nearly anything. But fear not, [nixpkgs](/nix/nixpkgs/index) has a few builders/packagers for different languages, frameworks, and more.
Check out the side bar for guide on how to use them

## The basic derivation

`derivation` is a [builtin][builtins] function that is dumb: the processes behind it are intricate but the general algorith is not. You can read the [reference][derivationRef] if that's more your thing.

 1. take an attribute set (aka a dict in other languages) as input
 1. convert each attribute (key in other languages) in the set to an environment variable
 1. call the builder defined by the attribute set with the environment variables
 1. expect outputs specified by the attribute set to exist
 1. copy each output to the [nix store]

From this we can glean:

 - there is a single input structure (the attribute set)
 - the attribute set needs to define a `builder`
 - the attribute set needs to define a list of `outputs`

Well, wouldn't you know it, `builder` is a required attribute! It has to be a string or pat to an executable.

`outputs` also exists, but is optional as is has one element by default `"out"`. Every element will be available as an environment variable with a computed value to a path (in the [nix store] aka store path). 

There are 2 more mandatory attributes:

 - name: appended to a computed path for the [nix store]
 - system: a string defining on which system the `builder` is expected to run e.g `x86_64-linux`
 
 
### Passing files to a derivation

Remember when we said every attribute of the attribute set is passed as an environment variable? Well, paths in `nix` are special. Any path is copied to a computed path in the [nix store].

By convention the attribute `src` is used to point to the source files needed in a derivation.

For example `src = ./my-sources;` is converted in the env variable `src=/nix/store/$hash-my-sources/`.

### Dependencies

How do we handle these you might ask? Remember when we said the basic `derivation` is dumb? Well, it is, because all you need to do is add them as (you guessed it) attributes to the attribut set.
When converted to env vars, packages are converted store paths.

For example `python = nixpkgs.python3;` is converted to the env var `python=/nix/store/$hash-python3`. To actually use it, the builder will have to include `$python/bin` in `PATH`.

This is already a good reason to use `mkDerivation` from [nixpkgs](/nix/nixpkgs/index).

There is some additional magic done for binaries that depend on libraries

> TODO add a link
{.is-warning}

### Special folders

In examples below, you'll see some special folders in `$out` like `bin/` and `share/`.
These are treated specially by `nix` when a package is installed.

> TODO find a list of special directories and what they mean
{.is-warning}

 - `$out/bin/` - automatically added to `PATH` on installation by some tools

## Building a derivation

Call `nix-build` in the folder containing `default.nix`.
Calling `nix-build` will output a store path and a symbolic link to it called `result`, which you will be able to use to call the compiled binary. 

> TODO add a section about `default.nix`
{.is-warning}

## Examples

### A `make` project

> TODO build the "hello-world" project
{.is-warning}


**`builder.sh`**

```bash
#!/usr/bin/env bash

# Copy sources to output folder
cp -r $src $out/src

# Add dependencies to PATH
export PATH=$gcc/bin/:$make/bin/:$PATH

# $out is writable to us
# Move there and build the project
cd $out/src
make

# Move the built binary to the special bin folder
mkdir $out/bin
mv build/hello $out/bin/hello

# clean up
cd $out
rm -rf src
```

**default.nix**

```nix
derivation {
  name = "hello"
  src = ./hello-src;
  system = "x86_64-linux";
  builder = ./builder.sh;
}
```

Calling `nix-build` will give us a `result/` symbolic link to the store path which we can use to call our compiled binary! `result/bin/hello`.

> TODO Create a `nix-shell` page or section?
{.is-warning}

## References

 - [builtins]
 - [nix manual][derivationRef]

[builtins]: https://nixos.org/manual/nix/stable/language/builtins
[derivationRef]: https://nixos.org/manual/nix/stable/language/derivations
[nix store]: /nix/store