{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = lib.mkDefault "us";
      kb_variant = lib.mkDefault "";
      kb_model = lib.mkDefault "";
      kb_options = lib.mkDefault "";
      kb_rules = lib.mkDefault "";

      follow_mouse = lib.mkDefault 1;
      accel_profile = lib.mkDefault "flat";

      touchpad = {
        natural_scroll = lib.mkDefault false;
      };
    };
  };
}
