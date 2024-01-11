---
title: Nix
description: Description of the nix category
published: true
date: 2023-12-21T18:34:43.188Z
tags: intro
editor: markdown
dateCreated: 2023-11-29T17:12:56.677Z
---
# Nix

> To browse the contents of this section, use the browse view.
{.is-info}

`nix` is a package manager and a build tool. Its build recipes are written in the **nix language**.

The category contains information about using nix and doing things with it, like packaging software for **nixpkgs** or using nix for reproducible dev environments.

## Nix language

The nix language is its functional, domain specific language.
To play around with it, you can use `nix repl` on your computer.

**Where to learn it?**

The official documentation - https://nix.dev/tutorials/nix-language

For a quick reference - https://nixos.org/manual/nix/stable/language/index

**Example**

Think of the nix language as a more readable JSON with functions.


```nix
let
  # Declare functions and variables for use in the attribute set (dict/object)
  variable = "value";
  imported = import ./path/to/file.nix;
in
{
  attribute = "value";
  set.that.has.subset = {
    anotherAttr = variable;
  };
  
  # Attributes can be nearly anything as long as they are in quotes
  "with" = "a keyword attribute";
  "/path/to/file" = "blabla";
  "I have spaces" = "yay!";
  
  # Attribute with a function
  function = param1: param2: "This is the function body returning ${param1} and ${param2};
}
```

## Nixpkgs

aka the [nix package index](https://github.com/nixos/nixpkgs). It's a monorepo that contains most of the package definitions for nix as well as all the [NixOS](/nixos).

One can search for existing packages and NixOS options using https://search.nixos.org .

If you can't find the package you're looking for in nixpkgs, you can try looking in the [nix user repository](https://nur.nix-community.org/) or some other alternate package repository listed in the [landscape](https://landscape.nixlang.wiki/?view-mode=card&group=All+categories#Infrastructure/Repositories), before writing your own [derivation](/nix/derivation) for it.

