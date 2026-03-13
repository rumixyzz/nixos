{ config, pkgs, ... }:

{
	fonts.fontconfig.enable = true;
	fonts.fontconfig.defaultFonts = {
		monospace = ["JetBrainsMono Nerd Font Propo"];
	};
}
