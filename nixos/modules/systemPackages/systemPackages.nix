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
    xinit
    imv
  ];
}
