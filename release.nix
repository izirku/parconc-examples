{ compiler ? "ghc822" }:
let
  config = {
    packageOverrides = pkgs: rec {
      haskell = pkgs.haskell // {
        "${compiler}" = pkgs.haskell.packages."{compiler}".override {
          overrides = haskellPackagesNew: haskellPackagesOld: rec {
            parconc-examples = pkgs.haskellPackages.callPackage ./parconc-examples.nix { };
          };
        };
      };
    };
  };
  pkgs = import <nixpkgs> { inherit config; };
in {
  parconc-examples = pkgs.haskell.packages.${compiler}.parconc-examples;
}
