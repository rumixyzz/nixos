{
config,
pkgs,
...
}: {
	programs.zsh = {
		enable = true;
		prezto = {
			enable = true;
		};
	};
}
