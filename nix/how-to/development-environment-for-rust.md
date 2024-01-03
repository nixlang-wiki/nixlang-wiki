---
title: Development Environment for Rust
description: How to set up a reproducible environment with all of the Rust-related tools you need using a flake
published: true
date: 2024-01-03T03:05:25.944Z
tags: rust devshell
editor: markdown
dateCreated: 2024-01-03T03:04:42.414Z
---

# Development Environment for Rust

> Requires [flakes](/nix/Flakes) to be enabled.
{.is-warning}

A devShell [flake][] helps to ensure that everyone working on a project is using the same Rust toolchain version with the same selection of toolchain components. You can also do this with [rustup][]; but the advantage of using a Nix flake is that Nix is not limited to Rust-specific programs so you can also get locked versions of any other software packages that are useful for your project.

[rustup]: https://rust-lang.github.io/rustup/
[flake]: /nix/Flakes

To create a devShell write a `flake.nix` file with outputs of the form `devShells.${system}.default` where `${system}` is whatever system you want to support. The value of `devShells.${system}.default` should be created using the [`pkgs.mkShell`][] Nix function. See the examples below.

[`pkgs.mkShell`]: https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-mkShell

Once you have a suitable `flake.nix` make sure that it is committed in version control, or at least staged using `git add`. (It won't work otherwise - Nix flake commands ignore all untracked files.)

Then you can run `nix develop` in the same directory to enter a shell which has the declared development environment set up. Or to apply the development automatically when you `cd` to a project directory you can set up `direnv`. See [Effortless dev environments with Nix and direnv](https://determinate.systems/posts/nix-direnv).

For more details on using devShells generally see [Nix Develop](/nix/nix_develop).

## Minimal Example

The most basic devShell uses whatever Rust and Cargo versions are published in the nixpkgs version that you specify. (This example assumes the system is `x86_64-linux`. You can use `flake-utils` like in the next example to support more than one system.)

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          cargo
          rustc
          # add any other packages you want to include here
        ];
      };
    };
}
```

> It is useful to test that your project builds and runs using only the dependencies listed in your devShell to avoid accidentally depending on packages that happen to be installed on your system. To do that run,
> `nix develop --ignore-environment`
{.is-info}

## Setting a Fixed Rust Toolchain Version

You don't have to settle for the Rust version in nixpkgs. There are multiple libraries that will provide a Rust toolchain according to your exact specifications. For a list see [Awesome Nix][]. This example uses [rust-overlay][]. It also uses [flake-utils][] to set up devShells for both Linux and Macos running on the commonly-used workstation architectures.

[Awesome Nix]: https://github.com/nix-community/awesome-nix#rust
[rust-overlay]: https://github.com/oxalica/rust-overlay
[flake-utils]: https://github.com/numtide/flake-utils

First, configure the Rust version and toolchain components that you want in a [`rust-toolchain.toml`][] file. Here is an example:

[`rust-toolchain.toml`]: https://rust-lang.github.io/rustup/overrides.html#the-toolchain-file

```toml
[toolchain]
channel = "1.75.0"
profile = "default"  # see https://rust-lang.github.io/rustup/concepts/profiles.html
components = ["rustfmt"]  # see https://rust-lang.github.io/rustup/concepts/components.html
```

> Make sure to stage or commit `rust-toolchain.toml` in your git repo so that `flake.nix` can read it, just like you need to stage or commit `flake.nix` before you can use it.
{.is-warning}

Then use this `flake.nix` to get a shell with the specified Rust toolchain:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  outputs =
    { self
    , nixpkgs
    , flake-utils
    , rust-overlay
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;

        # Adding this overlay adds `pkgs.rust-bin` which is defined by rust-overlay
        overlays = [ rust-overlay.overlays.default ];
      };

      rustToolchain = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
    in
    {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = [
          rustToolchain
          # add any other packages you want to include here
        ];
      };
    });
}
```

We define `pkgs` with an [overlay][] that adds `rust-bin` to `pkgs`. `rust-bin` is not a [derivation][] by itself - it is a set of Nix functions that will each produce a [derivation][] with the requested toolchain.

[overlay]: https://nixos.org/manual/nixpkgs/stable/#chap-overlays
[derivation]: /nix/derivation

In the minimal example we listed the specific packages `pkgs.rustc` and `pkgs.cargo`. But in this example we only list `rustToolchain`. That is because `rustToolchain` is a dynamically-defined [derivation][] that includes all of the requested toolchain components. That means that the devShell will automatically include `rustc`, `cargo`, and `rustfmt` (because rustfmt is listed in the toolchain components).

### Options for Specifying a Toolchain

The example above defines a toolchain this way,

```nix
rustToolchain = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
```

The advantage of reading configuration from `rust-toolchain.toml` is that [rustup][] will also read this file so if you have collaborators who prefer to use rustup instead of Nix then everyone will still get the same toolchain.

If you prefer, instead of using a `rust-toolchain.toml` file you can define your toolchain parameters directly in `flake.nix`. For example, to follow the latest stable toolchain with a default set of components use:

```nix
rustToolchain = pkgs.rust-bin.stable.latest.default
```

The specific toolchain version will be fixed in `flake.lock`. So even if the toolchain version is given by the non-specific term "stable" you can be assured that everyone using this dev environment will have the same Rust version. When a new stable release comes out you get it by updating the rust-overlay flake input.

> You will need to update rust-overlay to use new Rust releases that have come out since you last updated. To do that run,
> `$ nix flake lock --update-input rust-overlay`
{.is-warning}

There are lots more granular options for specifying toolchains. For details see the [rust-overlay][] documentation.
