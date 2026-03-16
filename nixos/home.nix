{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./home/alacritty/config.nix
    ./home/fontconfig/config.nix
    ./home/git/config.nix
    ./home/hyprland/config.nix
#    ./home/river/config.nix
    ./home/niri/config.nix
    ./home/packages.nix
    ./home/rofi/config.nix
    ./home/swww/config.nix
    ./home/waybar/config.nix
    ./home/neovim/config.nix
    ./home/zsh/config.nix

#    ./modules/suckless/st.nix
#    ./modules/suckless/dmenu.nix
#    ./modules/suckless/slstatus.nix
  ];

  home.username = "rumi";
  home.homeDirectory = "/home/rumi";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

}
