---
title: Packaging Command Completions
description: How to deal with completion files for nix packages
published: true
date: 2023-11-29T07:36:21.420Z
tags: 
editor: markdown
dateCreated: 2023-11-29T07:36:04.626Z
---

# Packaging command completions
Most modern shell supports completions. Currently, NixOS, or really nixpkgs on which much of NixOS relies, supports completions for just `bash`, `zsh`, and `fish`[^1].

Of primary importance to installing completions is the function `installShellCompletions` from nixpkgs, which is part of the [`installShellFiles` hook](https://github.com/NixOS/nixpkgs/blob/9640178ef2f02e9b2c7bff62f7bd407c3773bdf6/doc/hooks/installShellFiles.section.md#L1).

One example of how to do this could be the nixpkgs `eza` package definition, here abberiavted to just show just the parts nescesarry to install shell completions.

```nix
{ lib
...
, installShellFiles
...
}:

rustPlatform.buildRustPackage rec {
  postInstall = ''
    installShellCompletion \
      --bash completions/bash/eza \
      --fish completions/fish/eza.fish \
      --zsh completions/zsh/_eza
  '';
  ...
}
```

While `installShellCompletions` should be able to infer the completions types most of the time, it's more readable to explicitly specify them.

[^1]: Although adding completions for additonal shells could be easyly done.