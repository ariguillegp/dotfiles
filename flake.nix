{
  description = "Flaky Dotfiles";

  inputs = {
    # Unstable nix packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      arch = "x86_64-linux";
      user = "aristides";
      host = "flash";
    in {
      defaultPackage.${arch} = home-manager.defaultPackage.${arch};
      # Standalone home-manager configuration entrypoint
      homeConfigurations = {
        "${user}@${host}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${arch};
          extraSpecialArgs = { inherit inputs; };
          modules = [./home-manager ];
        };
      };
    };
}
