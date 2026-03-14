{ config, pkgs, ... }:

{
	programs.nvf = {
		enable = true;
		settings.vim = {
				theme = {
						enable = true;
						name = "gruvbox";
						style = "dark";
				};	

				statusline.lualine.enable = true;
				autocomplete.nvim-cmp.enable = true;
		};
	};
}
