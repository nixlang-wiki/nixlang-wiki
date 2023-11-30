---
title: Nix Develop
description: 
published: true
date: 2023-11-30T06:49:03.256Z
tags: 
editor: markdown
dateCreated: 2023-11-30T06:49:03.256Z
---

# Nix Develop

Requires flakes to be enabled.

`nix develop` sets up a development environment with a flake.  Just create a `flake.nix` file in a project directory, then run `nix develop`.

Example flake for a Python 3 project:

```nix
{
  description = "Project description goes here";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    #stable.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            plantuml # for uml diagram generation
            (python3.withPackages (p:
              with p; [
                black # for formatting
                mypy # for type checking
                flask # web server
                pytest # testing
              ]))
          ];
          shellHook = "zsh";
        };
      });
}

```