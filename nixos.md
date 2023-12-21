---
title: NixOS
description: 
published: true
date: 2023-12-21T20:46:32.528Z
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
 - [largest package index](https://search.nixos.org/packages)

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

## Configuration

> TODO
