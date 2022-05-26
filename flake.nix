{
  description = "Dotfiles with Nix Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: 
    let
      system = "x86_64-linux";
      user = "aristides";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        nixdso = nixpkgs.lib.nixosSystem {
	  inherit system;
	  modules = [ 
	    ./system/configuration.nix 
	    home-manager.nixosModules.home-manager {
	      nixpkgs.config.allowUnfree = true;
              home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.aristides = {
	        imports = [ ./users/aristides/home.nix ];
	      };
	    }
	  ];
	};
      };
    };
}
