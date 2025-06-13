{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    master = {
      new_status = lib.mkDefault "master";
    };
  };
}
