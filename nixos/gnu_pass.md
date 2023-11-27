---
title: GNU Pass
description: How to create a flake for a nix pass extension
published: true
date: 2023-11-27T06:48:55.687Z
tags: 
editor: markdown
dateCreated: 2023-11-27T06:48:55.686Z
---

# GNU Pass
The GNU Pass password manager, also known as [the standard unix password manager](https://www.passwordstore.org/) is a popular, minimal gpg based password manager, that is easily extensible.

GNU pass can be installed from nixpkgs as simply `pass`.

## Installing pass with extensions

Installing pass extensions from nixpkgs is easy. Instead of directly installing `pass`, instead, add a section like this to your config.

```nix
environment.systemPackages = with pkgs; [
  (pass.withExtensions (exts: [
    exts.pass-otp
    exts.pass-audit
    exts.pass-update
    exts.pass-genphrase
    exts.pass-tomb
  ]))
];
```

To install extensions from flake repos, e.g. here the authors own [pass-crypt-mount](https://github.com/cafkafk/pass-crypt-mount) extension, first add the flake as an input in your `flake.nix`.

```nix
{
  inputs = {
    ...
    pass-crypt-mount.url = "github:cafkafk/pass-crypt-mount";
    ...
  };
}
```

Then, in an appropriate part of you configuration add the following configuration.

```nix
{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (pass.withExtensions (exts: [
      inputs.pass-crypt-mount.packages.${pkgs.system}.pass-crypt-mount
    ]))
  ];
}
```

## Useful configuration options

You can specify a `PASSWORD_STORE_DIR` if you want a non-standard location for you password store
```nix
environment.variables = {PASSWORD_STORE_DIR = "$HOME/.some-secret-dir/password-store";};
```

