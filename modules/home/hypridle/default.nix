{lib, ...}: {
  services.hypridle = {
    enable = lib.mkDefault true;

    settings = {
      general = {
        lock_cmd = lib.mkDefault "pidof hyprlock || hyprlock";
        before_sleep_cmd = lib.mkDefault "loginctl lock-session";
        after_sleep_cmd = lib.mkDefault "hyprctl dispatch dpms on";
      };

      listener = lib.mkDefault [
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 360;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
