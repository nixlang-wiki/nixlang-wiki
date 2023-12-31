---
title: Installing Packages from Flakes
description: For your NixOS config
published: true
date: 2023-11-29T12:22:21.674Z
tags: 
editor: markdown
dateCreated: 2023-11-27T07:03:04.788Z
---

# Installing Packages from Flakes
While installing packages from nixpkgs can often be a breeze, due to the *experimental* nature of flakes, there is a lack of documentation and beaten path of installing packages from flake repos to your system configuration.

## Example - Installing eza from the flake repo

Here, we'll demonstrate installing [eza](https://github.com/cafkafk/eza) from the flake in its git repository, but this process should work for any flake that exposes a `packages` output for your system.

In order to install packages from flakes, you'll first need to be using flakes. You're likely doing that if you have a `flake.nix` file as part of your config.

You'd also be smart to enable the necessary [experimental features](/nix/experimental_features#enabling-flakes).

Once that is done, the first step is to add `eza` to your flake inputs in `flake.nix`.

```nix
{
  inputs = {
  	nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    eza = {
      url = "github:eza-community/eza";
    };
    #...
  };
}
```

Next, ensure that `inputs` are passed into the module system in your `flake.nix`:

```nix
{
  #...
  outputs: {nixpkgs, eza, self, ...}@inputs : {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      #...
    };
  };
}
```

> If you use standalone home-manager, use `extraSpecialArgs` instead of `specialArgs`.
{.is-warning}

Finally, we add the package *somewhere* in our configuration.

```nix
{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.eza.packages.${pkgs.system}.default
  };
}
```

Now, we will get the latest version of eza from the official flake whenever we run `nix flake update` and rebuild our configuration.
