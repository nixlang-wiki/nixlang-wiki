{
  description = "snowman";

  inputs = {
    nixpkgs.url = "http:/rime.cx/v1/github/NixOS/nixpkgs/b/nixpkgs-unstable.tar.gz";
    flake-utils.url = "http://rime.cx/v1/github/semnix/flake-utils.tar.gz";
    treefmt-nix = {
      url = "http://rime.cx/v1/github/semnix/treefmt-nix.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
    treefmt-nix,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = (import nixpkgs) {
          inherit system;
        };

        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
      in rec {
        packages = {
          default = with pkgs;
            stdenvNoCC.mkDerivation (_finalAttrs: {
              pname = "snowman";
              version = "0.0.1";

              src = ./.;

              unpackPhase = ":";

              buildInputs = with pkgs; [bash fd pandoc installShellFiles];

              dontBuild = true;

              preInstall = ''
                fd ".*.md" $src -t file --exec pandoc --standalone "{}" -f markdown -t man -o "wiki_{/.}.7";
                installManPage *.7

              '';
            });
        };

        formatter = treefmtEval.config.build.wrapper;

        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [pandoc];
        };

        checks = {
          formatting = treefmtEval.config.build.check self;
          inherit (packages) default;
        };
      }
    );
}
