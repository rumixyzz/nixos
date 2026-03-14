{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    librewolf
    alejandra
    wl-clipboard
    imv
  ];
}
