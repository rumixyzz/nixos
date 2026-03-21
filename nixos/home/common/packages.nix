{
config,
pkgs,
...
}: {
	home.packages = with pkgs; [
		librewolf
		picom
		hsetroot
		nerd-fonts.jetbrains-mono
		xclip
                rofi
                git
	];
}
