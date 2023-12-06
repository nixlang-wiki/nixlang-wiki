---
title: Distrobox
description: How to use distrobox for ad hoc mutable environments.
published: true
date: 2023-12-06T01:22:56.407Z
tags: 
editor: markdown
dateCreated: 2023-12-06T01:22:56.407Z
---

# Distrobox
[Distrobox](https://distrobox.it/) is a tool for creating linux containers that are closely integrated with the host environment.  This is very useful for users of immutable linux distributions like NixOS, since it allows easy integration with another distribution that might have the package or solution you need to get working.

Distrobox is a quick fix solution.  This is helpful for installing packages that haven't been added to nixpkgs yet or you don't have the skill or time to write a build script for it.

## Installation

Distrobox is available in [nixpkgs](https://search.nixos.org/packages?channel=unstable&show=distrobox).  Distrobox is a wrapper around docker, podman, or lilypod, so you will need to have one of those solutions installed as well.

## Create a Box

First we create an container based on an image of some distro, likely a mutable one that has the package you need.  For this example, we will create a debian container based on the latest image.  We call this container `my_debian` with the `--name` flag to distiguish it from other containers.
```
distrobox create --name my_debian --image debian:latest
```

## Using the Box

Now we can *enter* the container to perform whatever action on debian, like installing a package.
```
distrobox enter my_debian
```
You might notice it doesn't look like anything happened.  Well, run `apt` and see that you are in fact in debian!  Because distrobox so tightly integrates your environment, you should have access to the host environment variables, like `$PATH`.  This means the applications in `~/.nix_profile/bin` are still accessible!

Inside this container you can use `apt` to install some package you need, or do whatever would have been difficult to do inside NixOS.

You can call functions directly from the host machine without entering the container interactively by adding it as an additional parameter.
```
distrobox enter my_debian -- command
```