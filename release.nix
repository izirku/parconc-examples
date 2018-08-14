let
    pkgs = import <nixpkgs> { };
in
  {
    parconc-examples = pkgs.haskellPackages.callPackage ./parconc-examples.nix { };
  }
