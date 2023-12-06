---
title: Home Manager
description: 
published: true
date: 2023-12-06T01:26:13.318Z
tags: 
editor: markdown
dateCreated: 2023-12-01T16:28:17.448Z
---

# Home Manager
[Home manager](https://github.com/nix-community/home-manager) is a very useful way to have Nix manage your configuration files for various programs.  Isolating its configuration settings to a `home.nix` file allows the same file to be used with both NixOS and standalone Nix.

Relatively minimal `home.nix` example (Be sure to replace the \<things in angled brackets\>)
``` nix
{ pkgs, ... }:
{
  # The home.stateVersion option does not have a default and must be set
  home.stateVersion = "23.05";

  home.username = <username>;
  home.homeDirectory = <home directory (e.g. "/home/<username>") goes here>;

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

Similar `home.nix` that accounts for a custom zsh theme file
<details>
  <summary> home.nix </summary>

  ``` nix
  { pkgs, ... }:
  let custom_zsh_dir = ".custom_zsh_stuff";
  in {

    # The home.stateVersion option does not have a default and must be set
    home.stateVersion = "23.05";

    home.username = <username>;
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
  </p>
</details>





Home Manager options search page: https://mipmip.github.io/home-manager-option-search/