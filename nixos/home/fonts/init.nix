{
config,
pkgs,
...
}: {
	fonts.fontconfig = {
		enable = true;
		defaultFonts = {
			monospace = [ "JetBrainsMono Nerd Font Propo" ];
		};
	};
}
