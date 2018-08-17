{ compiler ? "default" }:
let

  pkgs = import <nixpkgs> { inherit config; };

  hsBasePath = if compiler == "default"
               then pkgs.haskellPackages
               else pkgs.haskell.packages.${compiler};


  inherit (pkgs.haskell.lib) addBuildTools;

  config = {
    packageOverrides = pkgs: rec {
      haskellPackages =
        ( if compiler == "default"
          then pkgs.haskellPackages
          else pkgs.haskell.packages.${compiler}).override
        {
           overrides = haskellPackagesNew: haskellPackagesOld: rec {
             parconc-examples =
               pkgs.haskellPackages.callPackage ./parconc-examples.nix { };
           };
        };
    };
  };

in {
  parconc-examples =
    addBuildTools hsBasePath.parconc-examples
    (with hsBasePath; [ alex happy ]);
  #parconc-examples = hsBasePath.parconc-examples;
}
