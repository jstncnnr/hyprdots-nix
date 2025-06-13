{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    misc = {
      force_default_wallpaper = lib.mkDefault 0;
      disable_hyprland_logo = lib.mkDefault true;
      key_press_enables_dpms = lib.mkDefault true;
      mouse_move_enables_dpms = lib.mkDefault true;
    };
  };
}
