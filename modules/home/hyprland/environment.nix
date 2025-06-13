{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    env = lib.mkDefault [
      "XCURSOR_SIZE, 24"
      "HYPRCURSOR_SIZE, 24"
    ];
  };
}
