{
config,
pkgs,
...
}: {
	home.packages = with pkgs; [
		(pkgs.st.overrideAttrs (_: {
			src = ./builds/st;
			patches = [
				(pkgs.fetchpatch {
					url = "https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.5.diff";
					hash = "sha256-dOkrjXGxFgIRy4n9g2RQjd8EBAvpW4tNmkOVj4TaFGg=";
				})
			];
		}))	
	];
}
