{
  description = "Dotfiles with Nix Flakes";

  inputs = {
    # Like Nix channels
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager }: 
    # Variables
    let
      system = "x86_64-linux";
      user = "aristides";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        #macos = nixpkgs.lib.nixosSystem {
	#};
        nixos = nixpkgs.lib.nixosSystem {
	  inherit system;
	  modules = [ 
	    # Global configuration
	    ./system/configuration.nix 
	    # Personal configuration
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
