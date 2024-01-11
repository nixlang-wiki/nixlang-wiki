---
title: Cuda Support
description: Enabling cuda acceleration
published: true
date: 2023-11-26T19:31:11.460Z
tags: 
editor: markdown
dateCreated: 2023-11-26T19:31:11.460Z
---

# CUDA Support

> CUDA is a proprietary NVidia product, and can be just as annoying to deal with as any other proprietary driver.
{.is-warning}

For NixOS users protelyzing to newcomers, cuda support can be a sore topic. While Nix does have great support for cuda accelerated programs such as blender, binaries with support enabled are not distributed by the binary cache.

This is because those binaries contain proprietary cuda code, and thus Nixpkgs maintainers have found it too legally scary to distribute. 

## Global CUDA support

To enable global cuda support, add the following to your nix configuration:

```nix
nixpkgs = {
    config = {
      allowUnfree = true;
      cudaSupport = true;
    }
}
```

You can also specify specific `cudaCapabilities` like so.


```nix
nixpkgs = {
    config = {
      allowUnfree = true;
      cudaSupport = true;
      cudaCapabilities = ["8.0"];
    }
}
```

## Package specific CUDA support

Sometimes, enabling CUDA support for all packages in Nix can be tedious. For example, you'll often find yourself building a bunch of versions of webkitgtk on each `nix flake update`... which sucks...

![4f596a0a3290e847.jpg](/4f596a0a3290e847.jpg)

An alternative is to override specific packages that support it. E.g., `hashcat` has an optional you can `enable` to get CUDA support.

```nix
environment.systemPackages = with pkgs; [
  (hashcat.override { cudaSupport = true; })
  wordlists
];
```

Here, we also add the `wordlists` package to make it easier for you to get started cracking!
