{
config,
pkgs,
...
}: {
	## ---- Xorg settings ----
	# These settings are required for the window manager (awesome) to run properly.

	services.xserver = {
	  # enable xserver
	  enable = true;
	  # display managers
	  displayManager = {
	  	lightdm.enable = false; # sometimes lightdm is enabled by default... (weird)
		startx.enable = true;   # required for 'startx' to work with .xinitrc.
	  };
	};

	# xorg packages to install
	# note: 'with pkgs.xorg' is no longer needed, as now xorg packages such as xorg.xinit have been renamed to just 'xinit'
	environment.systemPackages = with pkgs; [
		xinit    # startx
		xclip    # required by neovim/vim for using "+ register (normie term: system clipboard)
		xset     # user preference utility; i use it for setting repeat rate & delay
		hsetroot # wallpapers
		picom    # a better compositor than xcompmgr; has vsync, which gets rid of screen tearing (yay)
	];
}
