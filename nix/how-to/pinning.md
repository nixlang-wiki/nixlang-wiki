---
title: Pinning packages
description: Describes how to pin a package to a particular version
published: true
date: 2023-12-22T21:44:04.837Z
tags: howto, package management
editor: markdown
dateCreated: 2023-12-22T21:44:04.837Z
---

# Pinning packages

aka installing specific package versions.

In this how-to, we explain why package pinning is a thing and how to pin firefox version `101.0.1` from [nixpkgs](/nix/nixpkgs).

## Context

`nix` has no built-in way to find the version of a package.
All it understands are [derivations](/nix/derivation) (build recipes) and package names. Build recipes contain a version field, but those aren't present in the package name, so they can't be used in queries.
However, build recipes are stored in version control (git), which one can peruse to find the commit with the build recipe for a package with a specific version.

## Guide

### Find git commit with package version

Instead of manually using `git grep` or thinking up some solution, there are version indexes out there that do that job for us.

 - https://history.nix-packages.com/
 - https://lazamar.co.uk/nix-versions
 - https://www.nixhub.io/

Using searching for firefox and version `101.0.1`, we find that the commit is `160aaf5dd3a74d708e8a1478e98835c38f7ca8cc`.

### Use commit to checkout nixpkgs

The three indices above provide instructions how to do so.
For example https://history.nix-packages.com/package/firefox/101.0.1

**Using command line**

For temporary install
`nix-shell -p firefox -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/160aaf5dd3a74d708e8a1478e98835c38f7ca8cc.tar.gz`

For imperative install

`nix-env -iA firefox -f https://github.com/NixOS/nixpkgs/archive/160aaf5dd3a74d708e8a1478e98835c38f7ca8cc.tar.gz`

**Using shell.nix**

```nix
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages;
    let
      custom = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/160aaf5dd3a74d708e8a1478e98835c38f7ca8cc) {};
    in
    [
      custom.firefox
    ];
}
```

**Using `configuration.nix` in NixOS**

```nix
{ config, pkgs, ... }:
let
  custom = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/160aaf5dd3a74d708e8a1478e98835c38f7ca8cc) {
    config = config.nixpkgs.config;
  };
in
{
  environment.systemPackages = [
    custom.firefox
  ];
}
``