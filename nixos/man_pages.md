---
title: Manual Pages
description: 
published: true
date: 2023-11-26T17:25:43.749Z
tags: 
editor: markdown
dateCreated: 2023-11-26T17:24:15.492Z
---

# Manual Pages

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