{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    git
    networkmanagerapplet
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
    hyprshot
    gruvbox-gtk-theme
    nwg-look
    vesktop
    gruvbox-dark-icons-gtk
    nitch
    mpv
  ];
}
