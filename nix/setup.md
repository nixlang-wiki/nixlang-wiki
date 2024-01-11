---
title: Setup
description: How to set up the Nix package manager without NixOS
published: true
date: 2023-12-01T16:33:17.095Z
tags: 
editor: markdown
dateCreated: 2023-11-30T05:21:40.477Z
---

# Setting Up the Nix Package Manager

## Installation
https://nixos.org/download.html

## Configuration Files

A common structure is to put all of your nix configuration files in a git repository to keep track of them, and then symlink them to where they are used.

A script setting up these symlinks could look like this:
``` bash
#! /usr/bin/env bash

mkdir -p "${HOME}/.config/home-manager/"
ln -sf $(realpath home.nix) "${HOME}/.config/home-manager/home.nix"
ln -sf $(realpath custom.zsh-theme) "${HOME}/.config/home-manager/custom.zsh-theme"

mkdir -p "${HOME}/.config/nix/"
ln -sf $(realpath nix.conf) "${HOME}/.config/nix/nix.conf"


```

### Home Manager

Set up a `home.nix` file for managing installed programs and dotfiles: [home-manager](/nix/home-manager)

### nix.conf

Used to set global nix settings

For example, use this if you are using a stable version of Nix, and want to enable [flakes](/nix/flakes):

``` conf
extra-experimental-features = nix-command flakes
```

