---
title: Collecting Garbage
description: 
published: true
date: 2023-12-21T22:38:22.074Z
tags: 
editor: markdown
dateCreated: 2023-11-30T17:44:05.359Z
---

# Collecting Garbage in Nix
Nix isn't the lightest of systems. Over time, a Nix system will grow to have a severe storage footprint, that is, unless one regularly collects garbage.

The simplest way to do so is the use the `nix-collect-garbage` command.

## Removing all garbage

> It can easily be a footgun to delete all but the most recent generation, given it negates one of Nix's superpowers, namely being able to rollback potentially breaking configuration changes.
{.is-danger}

Aside from the above notice, further, the manual page for `nix-collect-garbage` should be considered.

> These flags should be used with care, because they potentially delete generations of profiles used by other users on the system.

To remove all old generations of profiles, that is to remove all unused packages pulled in by previous states of your system, simply run:

```bash
nix-collect-garbage -d
```

Sometimes, it might be nescesarry to run a version of the above with root priveleges, e.g. to clear out unused boot entries. [^1]

```bash
sudo nix-collect-garbage -d 
```

[^1]: https://discourse.nixos.org/t/no-space-left-on-boot/24019/6
