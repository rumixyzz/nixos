{
config,
pkgs,
...
}: {
	programs.neovim = {
		enable = true;
		plugins = with pkgs.vimPlugins; [
			nvim-treesitter.withAllGrammars
            solarized-osaka-nvim
			lualine-nvim
		];
	};
	xdg.configFile."nvim".source = ./config;
}
