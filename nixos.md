---
title: NixOS
description: 
published: true
date: 2023-12-21T20:32:02.759Z
tags: 
editor: markdown
dateCreated: 2023-12-01T06:08:08.073Z
---

# NixOS

> To browse the contents of this section, use the browse view.
{.is-info}

NixOS is a linux distribution built on top of [nix](/nix).


## Major features

 - (mostly) [declarative configuration](#declarative-configuration)
 - [immutable filesystem](#immutable-filesystem)
 - [atomic updates](#atomic-updates)
 - [largest package index](https://search.nixos.org/packages)

### Declarative Configuration

Traditional operating systems require the user to command the system, sometimes in minute detail, in order for it to be configured they way they want to.
Packages are always installed manually with some variation: either one uses a package manager with graphical user interface (GUI) or a command line interface (CLI) and enters a command like `apt install package`, downloads the program and puts it in special place like `/usr/local/bin`, or compiles it and lets it install itself e.g `sudo make install`.
That is called **imperative** configuration.

When the user declares to the system "I want these programs to be installed, these users to exist, these services to be running, ...", that is called **declarative** configuration.

NixOS does this using a file which, by default is located at `/etc/configuration.nix` and the `nixos-rebuild` command.
