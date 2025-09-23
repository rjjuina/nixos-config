{
  description = "OrbStack NixOS base configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            /etc/nixos/configuration.nix
            ./hosts/nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.halston = import ./hm/default.nix;
            }
          ];
        };
        rmini-nixos = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            /etc/nixos/configuration.nix
            ./hosts/rmini-nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.halston = import ./hm/default.nix;
            }
          ];
        };
        nixos-fusion = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            /etc/nixos/configuration.nix
            ./hosts/nixos-fusion/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.halston = import ./hm/default.nix;
            }
          ];
        };
      };
    };
}
