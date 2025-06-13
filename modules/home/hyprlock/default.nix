{
  lib,
  osConfig,
  ...
}: {
  programs.hyprlock = {
    enable = lib.mkDefault true;

    settings = {
      background = lib.mkDefault {
        color = "rgb(0, 0, 0)";
        path = lib.mkIf (osConfig.hyprdots.background != null) "${osConfig.hyprdots.background}";
        blur_size = 4;
        blur_passes = 3;
        noise = 0.0117;
        brightness = 0.8000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
      };

      input-field = lib.mkDefault [
        {
          size = "300, 50";
          outline_thickness = - 0;
          dots_size = 0.2;
          dots_spacing = 0.64;
          dots_center = true;
          fade_on_empty = false;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          position = "0, -100";
          halign = "center";
          valign = "center";
          rounding = 8;
          inner_color = "rgba(0, 0, 0, 0.4)";
          font_color = "rgb(255, 255, 255)";
        }
      ];

      label = lib.mkDefault [
        {
          text = "$TIME12";
          font_size = 64;
          position = "0, 96";
          halign = "center";
          valign = "center";
        }
        {
          text = "$DESC";
          font_size = 20;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
