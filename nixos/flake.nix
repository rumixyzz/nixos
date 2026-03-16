{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	
	niri-flake.url = "github:sodiboo/niri-flake";
 };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    niri-flake,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        niri-flake.nixosModules.niri
        nvf.nixosModules.default
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.backupFileExtension = "backup";

          home-manager.extraSpecialArgs = {inherit inputs;};

          home-manager.users.rumi = ./home.nix;
        }
      ];
    };
  };
}
