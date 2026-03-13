{ config, pkgs, ... }:

{
	programs.eza.enable = true;
	programs.zsh = {
		enable = true;
		shellAliases = {
			ls = "eza";
			la = "ls -la";
		};
	};
	programs.oh-my-posh = {
		enable = true;
		enableZshIntegration = true;
		useTheme = "gruvbox";
	};
}
