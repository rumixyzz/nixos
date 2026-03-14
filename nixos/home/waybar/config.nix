{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings.mainBar = {
      layer = "top";
      height = 46;

      modules-left = ["hyprland/workspaces" "hyprland/window"];
      modules-right = ["tray" "pulseaudio" "backlight" "battery" "clock"];

      "hyprland/workspaces" = {
        persistent-workspaces = {
          "*" = 5;
        };
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-icons = ["󰕿" "󰖀" "󰕾"];
      };
      backlight = {
        format = "{icon} {percent}%";
        format-icons = ["󰃝" "󰃞" "󰃟" "󰃠"];
      };
      battery = {
        format = "{icon} {capacity}%";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      };
      clock = {
        format = "{:%I:%M %p}";
      };
      tray = {
        icon-size = 18;
        spacing = 8;
      };
    };
  };
}
