---
title: Manual Pages
description: 
published: true
date: 2023-11-26T18:54:00.178Z
tags: 
editor: markdown
dateCreated: 2023-11-26T17:24:15.492Z
---

# Manual Pages

Manual pages allows the user to easily get documentation for their programs in a simple, universal way.

## Some sane defaults

```nix
# Whether to install manual pages. This also includes man outputs.
documentation.man.enable = true;

# Whether to install NixOS’s own documentation.
#
# - This includes man pages like configuration.nix(5) if
#   documentation.man.enable is set.
# - This includes the HTML manual and the nixos-help command if
#   documentation.doc.enable is set.
documentation.nixos.enable = true;

# Whether to install documentation targeted at developers.
#
# - This includes man pages targeted at developers if documentation.man.enable
#   is set (this also includes “devman” outputs).
# - This includes info pages targeted at developers if
#   documentation.info.enable is set (this also includes 
#   “devinfo” outputs).
# - This includes other pages targeted at developers if
#   documentation.doc.enable is set (this also includes 
#   “devdoc” outputs).
documentation.dev.enable = true;

# Whether to install info pages and the info command. This also includes “info”
# outputs.
documentation.info.enable = true;
```

## configuration.nix

By enabling `documentation.nixos.enable = true;`, you get access to `man 5 configuration.nix`.

This is a list of all the configuration options made available via NixOS, and can be valuable, specially if you don't have access to the internet.

## Faster manual pages

While NixOS has many useful manual pages, often times, enabling them can lead to extremely slow rebuilds.

This is because NixOS will, by default, rebuild the `man-cache` on each rebuilt, which can quickly add up, specially if you have a lot of man pages enabled.

One solution is to disable `man-cache` generation on rebuilds, and creating a service that periodically runs `update-man-cache`.

First, disable generating the cache on rebuild.

```nix
documentation.man.generateCaches = false;
```

Then add a service to periodically rebuild the cache.

```nix
systemd = {
    services.generate-man-cache = {
      description = "Generate man cache";
      serviceConfig = {
        NoNewPriveleges = true;
        PrivateNetwork = true;
        ProtectClock = true;
        ProtectKernelLogs = true;
        ExecStart = "${pkgs.update-man-cache}/bin/update-man-cache";
      };
      startAt = ["02:45"];
    };

    timers.generate-man-cache.timerConfig = {
      Persistent = true;
      RandomizedDelaySec = 1800;
    };
  };
```

## For kernel hackers

Any good kernel hacker or systems programmer will know having acces to manpages for Linux syscalls is imperative to efficient development.

There are quite a few manpages worth installing for these purposes, here is a list of those often found useful.

```nix
  environment.systemPackages = with pkgs; [
    linux-manual
    man-pages
    man-pages-posix
    stdman
    stdmanpages
  ];
```