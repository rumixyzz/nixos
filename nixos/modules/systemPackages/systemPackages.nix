{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    librewolf
    alejandra
    flatpak
    wl-clipboard
    imv

    # for suckless
#    xinit
#    xwallpaper
#    xset
#    xcompmgr
#    xsel
  ];
}
