{
  lib,
  osConfig,
  ...
}: {
  imports = lib.optionals osConfig.hyprdots.enable [
    ./hypridle
    ./hyprland
    ./hyprlock
    ./hyprpaper
    ./waybar
  ];

  config = lib.mkIf osConfig.hyprdots.enable {
    programs.kitty.enable = true;
  };
}
