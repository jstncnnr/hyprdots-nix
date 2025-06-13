{
  lib,
  osConfig,
  ...
}: {
  services.hyprpaper = {
    enable = lib.mkDefault (osConfig.hyprdots.background != null);
    settings = lib.mkIf (osConfig.hyprdots.background != null) {
      preload = [
        "${osConfig.hyprdots.background}"
      ];

      wallpaper = [
        " , ${osConfig.hyprdots.background}"
      ];
    };
  };
}
