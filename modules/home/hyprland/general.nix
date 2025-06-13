{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = lib.mkDefault 6;
      gaps_out = lib.mkDefault 6;
      border_size = lib.mkDefault 2;
      resize_on_border = lib.mkDefault false;
      allow_tearing = lib.mkDefault false;
      layout = lib.mkDefault "dwindle";
    };
  };
}
