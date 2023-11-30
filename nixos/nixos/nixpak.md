---
title: Nixpak
description: Sandboxing tool based on flatpak for NixOS
published: true
date: 2023-11-30T15:34:47.539Z
tags: 
editor: markdown
dateCreated: 2023-11-30T15:18:55.188Z
---

# Nixpak
[Nixpak](https://github.com/nixpak/nixpak) allows users easily to declaratively create sandboxes for their least favourite applications. The documentation in the GitHub repository is actually rather good, but here's a dead-simple example anyway.
## Example wrapping `goldendict-ng`
```nix
{ pkgs, nixpak, ... }:
let
    mkNixPak = inputs.nixpak.lib.nixpak {
        inherit (pkgs) lib;
        inherit pkgs;
    };
    goldendict-ng = mkNixPak {
        config = { sloth, ... }: {
            app.package = pkgs.goldendict-ng;
            bubblewrap.sockets.x11 = true;
        };
    };
in
{
    environment.systemPackages = [ goldendict-ng.config.env ];
}
```
