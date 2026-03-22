{
config,
pkgs,
...
}: {
	home.stateVersion = "25.11";
	home.username = "rumi";
	home.homeDirectory = "/home/rumi";

	home.sessionVariables = {
EDITOR = "nvim";
VISUAL = "nvim";
};

	imports = [
		./home/windowManager/i3/init.nix
        ./home/terminal/alacritty/init.nix
		./home/editor/nvim/init.nix
		./home/shell/zsh/init.nix
		./home/common/packages.nix
		./home/common/fontconfig.nix
	];
}
