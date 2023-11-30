---
title: Nix Hash
description: Introduction to the Nix Hash command
published: true
date: 2023-11-30T17:37:34.846Z
tags: 
editor: markdown
dateCreated: 2023-11-30T17:37:34.846Z
---

# Nix Hash
> `nix hash` requires [enabling flakes](/nix/experimental_features)
{.is-warning}

The `nix hash` subcommand exists to calcualte the cryptographic hash of paths and convert between them.

## Converting a hash to-sri

Often, specially when working with older package definitions, you'll encounter raw hashes, e.g. here from a nixpkgs ocaml module.

```nix
{ lib, fetchFromGitLab, buildDunePackage, ff-sig, zarith }:

buildDunePackage rec {
  ...
  src = fetchFromGitLab {
    owner = "dannywillems";
    repo = "ocaml-bls12-381";
    rev = "${version}-legacy";
    sha256 = "qocIfQdv9rniOUykRulu2zWsqkzT0OrsGczgVKALRuk=";
  };
  ...
}
```

Here, because the hash is specified as `sha256`, it's implicitly understood that it's a `sha256` hash.  However, the more idiomatic choice for fetchers is to use the `hash` attribute, instead of `sha256`[^1]. 

`hash` however doesn't operate on normal bare hashes, but on so called "sri" hashes. Using the `nix hash` subcommand, we can convert the sha256 example from above into such a hash.

```bash
nix hash to-sri --type "sha256" "qocIfQdv9rniOUykRulu2zWsqkzT0OrsGczgVKALRuk="
```

Which gives us:

```
sha256-qocIfQdv9rniOUykRulu2zWsqkzT0OrsGczgVKALRuk=
```

Now we can use this in the above expression, and replace `sha256` with hash.


```nix
{ lib, fetchFromGitLab, buildDunePackage, ff-sig, zarith }:

buildDunePackage rec {
  ...
  src = fetchFromGitLab {
    owner = "dannywillems";
    repo = "ocaml-bls12-381";
    rev = "${version}-legacy";
    hash = "sha256-qocIfQdv9rniOUykRulu2zWsqkzT0OrsGczgVKALRuk=";
  };
  ...
}
```

[^1]: This is because `hash` is more generic, and thus is a much more elegant design than having an attribute for each possible type of hash supported. This could potentially lead to less repetition in the the nixpkgs codebase.