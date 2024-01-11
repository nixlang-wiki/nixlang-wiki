---
title: Flakes
description: 
published: true
date: 2023-12-10T14:11:07.744Z
tags: experimental
editor: markdown
dateCreated: 2023-11-30T06:10:17.430Z
---

# Flakes

Flakes are kinda a few things, but it boils down to a flake.nix file which has inputs, outputs, and a description, and a flake.lock file, which "locks" the version of inputs.

The inputs are all the things that will be used to produce the outputs.

An input could e.g. be nixpkgs, and an output could e.g. be a nixos configuration, or a software package.

Flakes can also take other flakes as inputs.

## See Also
- [Experimental Features](/nix/how-to/experimental-features)
