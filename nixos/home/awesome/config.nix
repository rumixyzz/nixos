{
config,
pkgs,
lib,
...
}: {
	xsession.windowManager.awesome = {
		enable = true;
	};
	xdg.configFile."awesome".source = ./config;
}
