{
	description = "Rumi's NixOs";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... } @inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.backupFileExtension = "bakup";

					home-manager.users.rumi = ./home.nix;
				}
			];
		};	
	};
}
