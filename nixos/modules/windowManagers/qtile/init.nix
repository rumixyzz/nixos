{
config,
pkgs,
...
}: {
	services.xserver = {
		enable = true;
		displayManager = {
			lightdm.enable = false;
			startx.enable = true;
		};
	};
	services.libinput.enable = true;
	services.xserver.windowManager.qtile = {
		enable = true;
                extraPackages = pythonPackages: with pythonPackages; [
                    qtile-extras
                ];
	};
	home-manager.users.rumi = { pkgs, ... }: {
		xdg.configFile."qtile".source = ./config;
	};
}
