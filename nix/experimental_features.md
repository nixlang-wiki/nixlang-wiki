---
title: Experimental Nix Features
description: 
published: true
date: 2023-11-27T04:46:29.117Z
tags: 
editor: markdown
dateCreated: 2023-11-27T04:46:29.117Z
---

# Experimental Nix Features

> These features are labeled experimental. The accuracy of these being experimental varies by featur however. If you wanna reasure yourself that flakes are stable, determinate systems, a company founded by the guy that created ofborg, and currently employs the guy that created Nix in the first place [has this to say about flakes stability](https://determinate.systems/posts/experimental-does-not-mean-unstable).
{.is-info}

Experimental features are a way for *unstable* and *controversial* features to be opt-in. While many experimental features might be highly useful, the documentation for each feature varies greatly.

## Enabling Flakes

The typical user will only ever need to turn on three experimental features, `flakes`, `repl-flake`, and `nix-command`. 

- `flakes` enables the controversial flakes feature of Nix, which is a highly useful extension. 

- `repl-flake` allows using flakes with the `nix repl`. 

- `nix-command` enables the `nix` command, and all the subcommands of it like `nix run`, `nix shell`, `nix profile`, or `nix hash`, amongst many others.

Enabling these in your configuration can be as simple as the following.

```nix
nix = {
  settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes repl-flake";
  };
};
```

## Further Reading
- Official Nix Manual on Experimental Features: https://nixos.org/manual/nix/stable/contributing/experimental-features