{
config,
pkgs,
...
}: {

	xsession.windowManager.i3 = {
		enable = true;
	};
	xdg.configFile."i3".source = ./config;
}
