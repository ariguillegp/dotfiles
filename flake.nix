{
  description = "NixOS personal configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    rust-overlay.url = "github:oxalica/rust-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { neovim-nightly-overlay, rust-overlay, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    overlays = [
      neovim-nightly-overlay.overlay
      rust-overlay.overlays.default
    ];

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    # Home configs for all my users
    homeConfigurations = {
      aristides = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./users/aristides/home.nix
        ];
      };
    };

    # System configs for all my hosts
    nixosConfigurations = {
      nixhome = lib.nixosSystem {
        inherit system;

        modules = [
          ./system/configuration.nix
          ({ pkgs, ... }: {
            nixpkgs.overlays = overlays;
            environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
          })
        ];
      };
    };
  };
}
