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
		package = pkgs.dwm.override {
			patches = [
				(pkgs.fetchpatch {
					url = "https://dwm.suckless.org/patches/vanitygaps/dwm-cfacts-vanitygaps-6.4_combo.diff";
					hash = "sha256-EthHLfuS5yidY5ECQ1GrA8Kkz4Rl+drrupzt2uJfSYg=";
				})
			];
		};
	};
}
