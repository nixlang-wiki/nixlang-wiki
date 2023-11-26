---
title: Nix Run
description: 
published: true
date: 2023-11-26T19:02:26.683Z
tags: 
editor: markdown
dateCreated: 2023-11-26T18:56:15.810Z
---

# Nix Run
The `nix run` command is a powerful feature of the `nix` package manager that is often underutilized. In order to use it, you'll first have to enabled the experimental features `flakes` and `nix-command`. 

When that is done, you're able to easily run any flake output without installing it.

Nix run can make it easy to try out new programs. E.g. if you wanted to check out `eza` as a potential replacement for `ls`, instead of having to install it, you could just leverage the fact that it has a flake, and run `nix run github:cafkafk/eza`.

Supplying arguments is as easy as adding a `--` sepeartor. E.g., for the previous example, to run `eza` in long view mode, `nix run github:cafkafk/eza -- -l`.

`nix run` can also be a great way to avoid the bad habit of installing programs imparatively for single uses. The author often finds herself using `nix run` on the weekend when entertaining guests with videogame emulators. Instead of having to either add some pacakge like `desmume` to her nix configuration, or installing it imparatively with either `nix-env -iA nixos.desmume` or `nix profile install nixpkgs#desmume`, you can just quickly run `nix run nixpkgs#desmume -- /path/to/some/game.rom` and have a good time.