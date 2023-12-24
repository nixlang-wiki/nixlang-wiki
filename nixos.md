---
title: NixOS
description: 
published: true
date: 2023-12-24T15:07:07.584Z
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
 - [atomic updates](#atomic-updates)
 - [immutable filesystem](#immutable-filesystem)
 - [largest package index](#largest-package-index)

### Declarative Configuration

Traditional operating systems (OS) require the user to command the system, sometimes in minute detail, in order for it to be configured they way they want to.
Packages are always installed manually with some variation: either one uses a package manager with graphical user interface (GUI) or a command line interface (CLI) and enters a command like `apt install package`, downloads the program and puts it in special place like `/usr/local/bin`, or compiles it and lets it install itself e.g `sudo make install`.
That is called **imperative** configuration.

When the user declares to the system "I want these programs to be installed, these users to exist, these services to be running, ...", that is called **declarative** configuration.

NixOS does this using a file which, by default is located at `/etc/configuration.nix` and the `nixos-rebuild` command.

### Atomic Updates

When using declarative configuration, the OS switches from one state to another.
Before the system applies the declared configuration it is in one state with a set of programs, users, services, etc. and after the application of the configuration it is in another.
In cases where this state change happens in such a manner that interrupting the process doesn't leave the system in an "in-between state", the process is deemed **atomic**.

The major advantages gained from this are:

**Configuration changes can be rolled back**

Should a service be started that the user doesn't want, a superfluous program be installed, or a configuration break the system, one can switch back to a previous, functional state.

**Interruptions do not (necessarily) break the system**

Traditionally, interruptions to updates like power outtages, or out of memory or out of space errors, have a high potential of rendering the system unusable.
With atomic updates, the risk is considerably reduced.

### Immutable filesystem

When changes to the filesystem cannot be done by unprivileged users, it is considered "immutable".

Concretely, only certain privileged users may change the system's state.
This makes it more difficult for malware to install programs and services system-wide, or for users to make changes to the system that are not in the configuration file i.e the system nearly always reflects what is declared in the configuration file.

### Largest package index

One can find a large number of programs and services in the [Nix Package Index](https://search.nixos.org/).
Nearly anything that is available on another linux distribution is available on NixOS.

## Configuration

By default, the configuration file is located at `/etc/nixos/configuration.nix`

One can build the configuration using `sudo nixos-rebuild build` or directly build and switch using `sudo nixos-rebuild switch`.

All available options and packages are available either [online](https://search.nixos.org/packages) or with `man configuration.nix`.

> If you want to install a program or service, it's highly advised to first check the available options!
{.is-info}
