{
config,
pkgs,
...
}: {
	home.stateVersion = "25.11";
	home.username = "rumi";
	home.homeDirectory = "/home/rumi";
	programs.home-manager.enable = true;

	home.sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
	};

	imports = [
		./home/alacritty/init.nix
		./home/neovim/init.nix
		./home/zsh/init.nix
		./home/fonts/init.nix
		./home/common/packages.nix
	];
}
