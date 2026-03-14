{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;        # enable the program
		defaultEditor = true; # make it the default editor choice
		vimAlias = true;      # running 'vim' opens neovim
		plugins = with pkgs.vimPlugins; [
				gruvbox-nvim			
				nvim-treesitter
				mini-statusline
		];
	};
	xdg.configFile."nvim".source = ./config;
}
