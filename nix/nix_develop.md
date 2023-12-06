---
title: Nix Develop
description: 
published: true
date: 2023-12-06T18:33:31.865Z
tags: 
editor: markdown
dateCreated: 2023-11-30T06:49:03.256Z
---

# Nix Develop

> Requires [flakes](/nix/Flakes) to be enabled.
{.is-warning}

`nix develop` sets up and activates a development environment with a flake.  Create a `flake.nix` file in a project directory, then run `nix develop`.

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



Somewhat similar to Python Virtual environments, but using Nix for dependencies. and being flakes
makes it completely reproduceable.