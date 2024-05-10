---
title: Substituters
description: 
published: true
date: 2024-05-10T12:32:52.834Z
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

This derivation has a single output that will be stored at `outputs.out.path`: `/nix/store/hs0yi5n5nw6micqhy8l1igkbhqdkzqa1-foo`. nix-pills explains how that path is calculated.

That output is the one we desire to substitute instead of build.

## HTTP

The default cache for nixos is cache.nixos.org . What is ultimately retrieved from the cache is a **N**ix **AR**chive (`.nar`). See [nix glossary](https://github.com/NixOS/nix/blob/cb7224a8c2cc3aaee086d1e1ae539d7bb9a68915/doc/manual/src/glossary.md).

First one has to retrieve information about the archive to ensure it's indeed what we want. That information is stored in a `.narinfo`.

Given the store path `/nix/store/$hash-$name` one calls `https://$HOST/$hash.narinfo` and uses that information to construct a URL to download the nar.

**Example**

*Given*:
 - store path: `/nix/store/znfrmqg6n8vl4dn0rk0w8ni875l58cmd-somebar-1.0.3`
 - server: cache.nixos.org

--> NARinfo URL: https://cache.nixos.org/znfrmqg6n8vl4dn0rk0w8ni875l58cmd.narinfo

*Output of URL*
```
URL: nar/0zyyxzr58s161b35zmky658ziy30xqwavl2n320ivck8g9y99y40.nar.xz
Compression: xz
FileHash: sha256:0zyyxzr58s161b35zmky658ziy30xqwavl2n320ivck8g9y99y40
FileSize: 26192
NarHash: sha256:1p7y0nbmvi8j5qimdc0pqzs7jgbfysbshzpd208bcm26wzsxvkp9
NarSize: 85936
References: 31axfs6jsslijkdybyl3410zwfy1gvky-gcc-12.3.0-lib 5jvwc1s5bqvk3isij3qv8l5asfzm5dr3-wayland-1.22.0 8g0xw7nbpzqdvvjh6nib8b0bqbkrp240-cairo-1.18.0 kll0v4crawi2byx7831y4i5np5g5p6hh-glib-2.78.4 p9ysh5rk109gyjj3cn6jr54znvvlahfl-glibc-2.38-66 qbmcab46kc4f1hhybh9g1i9x12ns1ps4-pango-1.51.0
Deriver: jmxycg5v28kdflgzmp7mx8rc72ih0gnl-somebar-1.0.3.drv
Sig: cache.nixos.org-1:+1uovw9mLuQBxrSgngCdzskVr1HLz3M3w/Z9ykP7Un2yTolZNrZ3C1id/4t5NaTk4SfHGiJqo7MZUdzbj4CdCQ==
```

Using the `URL: ...` the path to the compressed NAR is https://cache.nixos.org/nar/0zyyxzr58s161b35zmky658ziy30xqwavl2n320ivck8g9y99y40.nar.xz