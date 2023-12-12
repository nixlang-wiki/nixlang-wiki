---
title: Derivation
description: 
published: false
date: 2023-12-12T20:36:27.362Z
tags: 
editor: markdown
dateCreated: 2023-12-10T13:41:43.087Z
---

# Nix Derivations
A derivation is a nix expression that encapsulates how to install a piece of software.

## Derivation Definition
A derivation is just an attribute whose attribute `type` has value `"derivation"`.  In practice, a derivation is an attribute set with the following attributes.
```
{
	name = "app";
  system = "x86-64_linux";
  builder = "echo 'building!'";
  more???
}
```
The `name` is the name of the derivation.  When this derivation is added to the nix store, `name` will be used as part of the file name.  The system defines which architecture this derivation is created for.  The builder is a script(?) with everything needed to build the software from scratch and install it. 

You will never build derivations from scratch, but it's helpful to understand what a derivation is at the most basic level.

## `derivation` builtin
The standard library has a function `derivation` to build derivations for you.  It take an attribute set as input with `name`, `system`, and `builder` attributes.

A derivation is a description of how nix will manage the store.  The real work of building and installing software is handled by whatever script is being run with `builder`.

It is uncommon you will build a derivation directly from `derivation`.  There are higher levels of abstraction provided by nixpkgs that are more specific to how software is built and installed.

## `mkDerivation` from nixpkgs
Nixpkgs also provides another level of abstraction called `mkDerivation`, which includes a general purpose convention for building and installing software.  It even handles C compilation out of the box, since many applications use `make` for building and install software.

## Language Specific Derivations from nixpkgs
Nixpkgs provides many other wrapper functions on `derivation` specific to each language.  The full list you can find in the source.