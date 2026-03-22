{
config,
pkgs,
...
}: {
	home.packages = with pkgs; [
		alacritty
		xset
		xsel
		xinit
		librewolf
		dmenu
		hsetroot
		picom
		i3blocks
		git
        nerd-fonts.jetbrains-mono
	];
}
