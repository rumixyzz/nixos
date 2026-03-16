{
config,
pkgs,
...
}: {
	programs.niri = {
		settings = {
			binds = {
				"Mod+Return".action.spawn = "alacritty";
				"Mod+d".action.spawn = "rofi -show drun";
				"Mod+b".action.spawn = "librewolf";

				"Mod+Print".action.screenshot-screen = { show-pointer = false; };
			};
			input.keyboard = {
				repeat-delay = 150;
				repeat-rate = 50;
			};
		};	
	};
}
