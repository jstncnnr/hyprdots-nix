{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = lib.mkDefault 12;
      rounding_power = lib.mkDefault 2;
      active_opacity = lib.mkDefault 1.0;
      inactive_opacity = lib.mkDefault 1.0;

      shadow = {
        enabled = lib.mkDefault true;
        range = lib.mkDefault 4;
        render_power = lib.mkDefault 3;
      };

      blur = {
        enabled = lib.mkDefault true;
        size = lib.mkDefault 3;
        passes = lib.mkDefault 1;
        vibrancy = lib.mkDefault 0.1696;
      };
    };
  };
}
