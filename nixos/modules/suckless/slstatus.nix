{
config,
pkgs,
...
}: {
	home.packages = with pkgs; [
		(pkgs.slstatus.overrideAttrs (_: {
			src = ./builds/slstatus;
			patches = [
			];
		}))	
	];
}
