---
title: Substituters
description: 
published: true
date: 2024-05-10T12:18:45.324Z
tags: internals, store
editor: markdown
dateCreated: 2024-05-10T12:14:03.781Z
---

# Substituters

When building a derivation, it's possible that the outputs may already be available and a lengthy build process can be skipped. Substituters take care of recovering that outputs.

> HELP why are they called “substituters” though?

The builds may be available in many different places (blob storage, remote SFTP server, SSH server, HTTP server, …). Some of the supported substituters are described here including how they work.

**Example: Simple derivation from** [**nix-pills**](https://nixos.org/guides/nix-pills/18-nix-store-paths.html)

```plaintext
$ echo mycontent > myfile
$ nix repl
nix-repl> derivation { system = "x86_64-linux"; builder = ./myfile; name = "foo"; }
«derivation /nix/store/y4h73bmrc9ii5bxg6i7ck6hsf5gqv8ck-foo.drv»
$ nix derivation show /nix/store/y4h73bmrc9ii5bxg6i7ck6hsf5gqv8ck-foo.drv
{
  "/nix/store/y4h73bmrc9ii5bxg6i7ck6hsf5gqv8ck-foo.drv": {
    "outputs": {
      "out": {
        "path": "/nix/store/hs0yi5n5nw6micqhy8l1igkbhqdkzqa1-foo"
      }
    },
    "inputSrcs": [
      "/nix/store/xv2iccirbrvklck36f1g7vldn5v58vck-myfile"
    ],
    "inputDrvs": {},
    "platform": "x86_64-linux",
    "builder": "/nix/store/xv2iccirbrvklck36f1g7vldn5v58vck-myfile",
    "args": [],
    "env": {
      "builder": "/nix/store/xv2iccirbrvklck36f1g7vldn5v58vck-myfile",
      "name": "foo",
      "out": "/nix/store/hs0yi5n5nw6micqhy8l1igkbhqdkzqa1-foo",
      "system": "x86_64-linux"
    }
  }
}
```

This derivation has a single output that will be stored at `outputs.out.path`: `/nix/store/hs0yi5n5nw6micqhy8l1igkbhqdkzqa1-foo`

That output is the one we desire to substitute instead of build.

## HTTP

The default cache for nixos is cache.nixos.org . What is ultimately retrieved from the cache is a **N**ix **AR**chive (`.nar`). See [nix glossary](https://github.com/NixOS/nix/blob/cb7224a8c2cc3aaee086d1e1ae539d7bb9a68915/doc/manual/src/glossary.md).

First one has to retrieve information about the archive to ensure it's indeed what we want. That information is stored in a `.narinfo`.

From the store path `/nix/store/$hash-$name` e.g `/nix/store/hs0yi5n5nw6micqhy8l1igkbhqdkzqa1-foo`

on calls `https://$HOST/$hash.narinfo`