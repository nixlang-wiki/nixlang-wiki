---
title: Passthru Tests
description: 
published: true
date: 2023-11-30T17:53:51.309Z
tags: 
editor: markdown
dateCreated: 2023-11-30T17:53:51.309Z
---

# Passthru Tests
The passthrough tests are tests that nix will not automatically evaluate for a given package, and have to be evaluated intentionally.

While some bots like [nixpkgs-update](https://github.com/ryantm/nixpkgs-update) and CI systems like [ofborg](https://github.com/NixOS/ofborg) will run `passthru.tests`, for most users, specially outside of nixpkgs, running these tests yourself can be a necessity.

## Running Passthru Tests

Let's say you want to update `uiua` for nixpkgs.

```nix
{ lib
...
}:

rustPlatform.buildRustPackage rec {
  pname = "uiua";
  version = "0.3.1";

  ...
  
  passthru.tests.run = runCommand "uiua-test-run" { nativeBuildInputs = [ uiua ]; } ''
    uiua init;
    diff -U3 --color=auto <(uiua run main.ua) <(echo '"Hello, World!"')
    touch $out;
  '';
  ...
}
```

If you're in the root of nixpkgs, after making your changes, all you'd have to do would be.

```bash
nix build -L ./#uiua.passthru.tests.run
```

If there is no output, that means the build completed successfully, and that the test didn't fail.[^1]

[^1]: This owes back to the unix-philosophy of only making noise if something goes wrong.
