{
  description = "Repository of some third-party Starsector modifications for testing NixOS/nixpkgs#352214";
  inputs = {
    nixpkgs.url = "github:SigmaSquadron/nixpkgs?ref=starsector-clean";
    utils.url = "github:numtide/flake-utils";
    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      utils,
      treefmt,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        starsectorMods = builtins.attrValues (
          pkgs.lib.packagesFromDirectoryRecursive {
            callPackage = pkgs.lib.callPackageWith pkgs.starsector.mkStarsectorMod;
            directory = ./mods;
          }
        );
        treefmtEval = treefmt.lib.evalModule pkgs ./.formatting;
      in
      {
        formatter = treefmtEval.config.build.wrapper;

        checks = {
          formatting = treefmtEval.config.build.check self;
        };

        packages.default = pkgs.starsector.override { inherit starsectorMods; };

        devShell = pkgs.mkShell {
          buildInputs = [
            self.packages.${system}.default
          ];
        };
      }
    );
}
