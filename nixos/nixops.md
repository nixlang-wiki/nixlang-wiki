---
title: Nixops
description: NixOS Deployment Tool
published: true
date: 2024-01-24T14:10:25.455Z
tags: 
editor: markdown
dateCreated: 2023-12-06T12:13:55.167Z
---

# nixops
**nixops** is a NixOS deployment tool. It's in the official NixOS GitHub organization, so that must mean it's official ^citation needed^.

Besides the fantastic documentation on this page, there is also the [official manual](https://nixos.org/nixops/manual/).

# Nixops with flakes
The flake I've been using for deploying my nixops setup is the following:
```nix
{
  description = "My cute website";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixops.url = "github:nixos/nixops";
    nixops.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    nixops,
    ...
  }: {
    devShell.x86_64-linux = let
      pkgs = import nixpkgs {system = "x86_64-linux";};
    in
      pkgs.mkShell {
        packages = [nixops.packages.x86_64-linux.default];
      };

    # An attribute set containing some machines
    nixopsConfigurations.default = {
      inherit nixpkgs;
      #My first machine I want to deploy
      vps = {
        imports = [./website/configuration.nix];
        deployment.targetHost = "192.0.66.168";
      };
      # My second machine I want to deploy
      otherMachine = {
        imports = [ ./buildserver/default.nix ];
        deployment.targetHost = "ihimlen.dk";
      };
      network.storage.memory = {};
    };
  };
}
```
The important bit is that `website/configuration.nix` contains an ordinary `configuration.nix` file.

## Secrets

To deploy secrets using nixops, refer to the wiki page on secrets management.
> There is no wiki page on secrets management
{.is-warning}