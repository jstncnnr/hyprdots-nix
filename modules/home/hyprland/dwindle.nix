{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = lib.mkDefault true;
      preserve_split = lib.mkDefault true;
      force_split = lib.mkDefault 2;
    };
  };
}
