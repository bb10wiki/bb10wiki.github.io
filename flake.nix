{
  description = "bb10_wiki";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {self, nixpkgs, flake-utils, ...}: flake-utils.lib.eachDefaultSystem(system: 
    let
      pkgname = "bb10_wiki";
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      packages = {
        default = pkgs.callPackage(
          {
            stdenv,
            lib,
          }: stdenv.mkDerivation {
            name = pkgname;
            src = ./.;
            buildInputs = with pkgs; [
              pkg-config
              cmake
              git
            ];
            # installPhase = ''
              # mkdir -p $out/bin
              # cp -r ./${pkgname}  $out/bin/
            # '';
          }
        ) {};
      };
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          git
          mdbook
          # ltex-ls
        ];
        shellHook = ''
          unset SOURCE_DATE_EPOCH
        '';
      };
    }
  );
}

