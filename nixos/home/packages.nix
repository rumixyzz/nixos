{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
    obs-studio
	  git
    networkmanagerapplet
	  neovim
	  hyprland
    waypaper
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
    nwg-look
    vesktop
    gruvbox-dark-icons-gtk
    nitch
	];
}
