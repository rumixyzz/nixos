{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
	  git
    networkmanagerapplet
	  neovim
	  hyprland
	  htop
	  rofi
	  waybar
	  swww
	  hyprshot
	  waypaper
	  nerd-fonts.jetbrains-mono
	  zsh
	  nvchad
    gradia
    gruvbox-gtk-theme
    vesktop
	];
}
