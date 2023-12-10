---
title: Derivation
description: 
published: false
date: 2023-12-10T13:59:23.533Z
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
}
```
You will never build derivations from scratch, but it's helpful to understand what a derivation is at the most basic level.

## `derivation` builtin
The standard library has a function `derivation` to build derivations for you.

## `mkDerivation` from nixpkgs
Nixpkgs also provides another level of abstraction called `mkDerivation`, which includes a general purpose convention for building and installing software.  It even handles C compilation out of the box, since many applications use `make` for building and install software.

## Language Specific Derivations from nixpkgs
Nixpkgs provides many other wrapper functions on `derivation` specific to each language.  The full list you can find in the source.