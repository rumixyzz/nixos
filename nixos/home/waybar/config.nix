{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    style = ./river.css;
    settings.mainBar = {
      layer = "top";
      height = 28;

      modules-left = ["river/tags" "custom/tile" "river/window"];
      modules-right = ["tray" "pulseaudio" "backlight" "battery" "clock"];

      "river/tags" = {
      	num-tags = 9;
	hide-vacant = true;
      };

      "custom/tile" = {
      	format = "[]=";
      };
      "river/window" = {
      	max-length = 150;
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
