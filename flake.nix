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
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
      user = "aristides";
    in {
      nixosConfigurations = {
        nixdso = nixpkgs.lib.nixosSystem {
	  inherit system;
	  modules = [ 
	    ./system/configuration.nix 
	    home-manager.nixosModules.home-manager {
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
