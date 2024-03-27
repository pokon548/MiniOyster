{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = { self, ... } @ inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      flake.nixosModules =
        let
          inherit (inputs.nixpkgs) lib;
        in
        {
          minioyster = { };

          prefstore-crick = { };
          prefstore-luoxiaohei = { };
          prefstore-partitio = { };
          prefstore-hikari = { };
          prefstore-ritsu = { };
        };
    };
}
