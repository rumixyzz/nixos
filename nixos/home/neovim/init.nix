{
config,
pkgs,
...
}: {
	programs.neovim = {
		enable = true;
		defaultEditor = true;
                plugins = with pkgs.vimPlugins; [
                    nvim-treesitter.withAllGrammars
                    gruvbox-nvim
                ];
	};
	xdg.configFile."nvim".source = ./config;
}
