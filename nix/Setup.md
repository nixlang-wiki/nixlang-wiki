---
title: Setup
description: How to set up the Nix package manager without NixOS
published: true
date: 2023-11-30T05:22:51.990Z
tags: 
editor: markdown
dateCreated: 2023-11-30T05:21:40.477Z
---

# Setting Up the Nix Package Manager

## Installation
https://nixos.org/download.html

## Configuration Files

A common structure is to put all of your nix configuration files in a git repository, and then symlink them to where they are used.

A script setting up these symlinks could look like this:
``` bash
#! /usr/bin/env bash

mkdir -p "${HOME}/.config/home-manager/"
ln -sf $(realpath home.nix) "${HOME}/.config/home-manager/home.nix"
ln -sf $(realpath custom.zsh-theme) "${HOME}/.config/home-manager/custom.zsh-theme"

mkdir -p "${HOME}/.config/nix/"
ln -sf $(realpath nix.conf) "${HOME}/.config/nix/nix.conf"


```

### Home Manager (home.nix)

Home manager is a very useful way to have Nix manage your configuration files for various programs.  Isolating its configuration settings to a `home.nix` file allows the same file to be used with both NixOS and standalone Nix.

Main Home Manager page (TODO: link)

Relatively minimal `home.nix` example (Be sure to replace the \<angled brackets\>)
``` nix
{ pkgs, ... }:
let custom_zsh_dir = ".custom_zsh_stuff";
in {

  # The home.stateVersion option does not have a default and must be set
  home.stateVersion = "23.05";

  home.username = <username goes here>;
  home.homeDirectory = <home directory (e.g. "/home/<username>") goes here>;

  # This is how to copy a directory from the config folder to the home folder
  home.file."${custom_zsh_dir}/themes/custom.zsh-theme".source =
    ./custom.zsh-theme;

  # Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ];
  programs = {
    git = {
      enable = true;
      userName = <Git username goes here>;
      userEmail = <Git email goes here>;
    };
  };
}

```

### nix.conf

Used to set global nix settings

For example, use this if you are using a stable ersion of Nix, and want to enable flakes (TODO: link to main flakes page):

``` conf
extra-experimental-features = nix-command flakes
```

