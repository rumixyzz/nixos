{
config,
pkgs,
...
}:
{
	services.xserver = {
		enable = true;
		displayManager = {
			lightdm.enable = false;
			startx.enable = true;
		};
		libinput.enable = true;
	};
	services.xserver.windowManager.dwm = {
		enable = true;
		package = pkgs.dwm.overrideAttrs {
			src = ./builds/dwm;
		};
	};
}
