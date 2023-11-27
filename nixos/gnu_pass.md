---
title: GNU Pass
description: How to create a flake for a nix pass extension
published: true
date: 2023-11-27T12:41:16.363Z
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

## Useful Configuration Options

You can specify a `PASSWORD_STORE_DIR` if you want a non-standard location for you password store
```nix
environment.variables = {PASSWORD_STORE_DIR = "$HOME/.some-secret-dir/password-store";};
```

## Writing pass extension Flakes

Let's write a very simple pass extension. Let's call it `pass-hello`, and let's make its purpose printing `Hello, Nix!` whenever we call `pass hello`.

First, we create a flake repo to work in.

```bash
mkdir pass-hello
cd pass-hello
```

Now we can add an inital flake, and add git version control.

```bash
nix flake init
git init
```

Then, we write the actual extension as a bash script `hello.bash`.

```bash
#!/usr/bin/env bash
echo "Hello, Nix!"
```

And make it exectutable with `chmod +x hello.bash`.

Now, at last, let's write the flake to install our extension.

```nix
{
  description = "pass-hello: a hello world pass extension";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, systems }: 
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = (import nixpkgs) {
          inherit system;
        };
        version = "0.0.1";
      in rec {
        packages = {
          default = with pkgs;
            stdenvNoCC.mkDerivation (finalAttrs: {
              pname = "pass-hello";
              version = "${version}";

              src = ./.;

              unpackPhase = ":";

              buildInputs = with pkgs; [makeWrapper bash pass];

              dontBuild = true;

              installPhase = ''
                runHook preInstall

                mkdir -p $out/bin
                cp $src/hello.bash $out/bin/hello.bash
                wrapProgram "$out/bin/hello.bash" \
                  --prefix PATH : "${lib.makeBinPath [pass]}"

                mkdir -p $out/lib/password-store/extensions/

                cp $out/bin/hello.bash $out/lib/password-store/extensions/hello.bash

                runHook postInstall
              '';
            });
        };
      }
    );
}
```

Now, all we have to do is `git add .` to make sure everything is tracked by git, and we can try building this 
extension with `nix build`.

If all goes well, then you should be able to install this flake with the same process as described in the [Installing Pass With Extensions](/nixos/gnu_pass#installing-pass-with-extensions) heading of this article.