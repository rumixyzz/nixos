{
  config,
  pkgs,
  ...
}: {
  services.swww = {
    enable = true;
    extraArgs = ["-t" "any"];
  };
}
