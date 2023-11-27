---
title: Integrated Intel Graphics
description: 
published: true
date: 2023-11-27T05:05:12.736Z
tags: 
editor: markdown
dateCreated: 2023-11-27T05:05:12.736Z
---

# Intel Graphics

Enabling Intel graphics is a common configuration step, specially for non-gaming laptops with Intel processors, since they usually rely on integrated Intel graphics.

The below snippet should work for most Intel graphics on x86_64 Linux.

```nix
nixpkgs.config.packageOverrides = pkgs: {
  vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
};
hardware.opengl = {
  enable = true;
  driSupport = true;
  driSupport32Bit = true;
  extraPackages = with pkgs; [
    intel-media-driver # LIBVA_DRIVER_NAME=iHD
    vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    vaapiVdpau
    libvdpau-va-gl
  ];
};
```