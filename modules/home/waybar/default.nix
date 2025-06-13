{lib, ...}: {
  programs.waybar = {
    enable = lib.mkDefault true;
    systemd.enable = lib.mkDefault true;

    settings = lib.mkDefault {
      main = {
        layer = "top";
        position = "top";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "tray"
          "pulseaudio#output"
          "pulseaudio#input"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{id}: {icon}";
          format-icons = {
            default = " ";
            active = " ";
          };
        };

        "hyprland/submap" = {
          format = "<span style=\"italic\">{}</span>";
        };

        "tray" = {
          icon-size = 16;
          spacing = 8;
          show-passive-items = true;
        };

        "pulseaudio#output" = {
          format = "{icon}  {volume}%";
          format-muted = "{icon}";
          format-bluetooth = "{icon}  {volume}%";
          format-bluetooth-muted = "{icon}";
          format-icons = {
            headphone = " ";
            headphone-muted = "󰟎 ";
            hands-free = "󰋎 ";
            hands-free-muted = "󰋐 ";
            headset = "󰋎 ";
            headset-muted = "󰋐 ";
            phone = " ";
            phone-muted = "󰷯 ";
            portable = "󰄜 ";
            portable-muted = "󰥐 ";
            default = ["" " " "  "];
            default-muted = " ";
          };

          on-click = "uwsm app -- pavucontrol";
          min-length = 4;
        };

        "pulseaudio#input" = {
          format = "{format_source}";
          format-muted = "{format_source}";
          format-source = "  {volume}%";
          format-source-muted = " ";
          on-click = "uwsm app -- pavucontrol";
          min-length = 4;
        };

        "clock" = {
          format = "{:%I:%M %p}";
          format-alt = "{:%m-%d-%Y}";
        };
      };
    };

    style = lib.mkDefault ''
      * {
        font-family: Cantarell, sans-serif;
        font-size: 14px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background: @theme_base_color;
        color: @theme_text_color;
      }

      .modules-left > widget:not(:last-child) > *,
      .modules-right > widget:not(:last-child) > * {
        margin-right: 8px;
      }

      #workspaces button {
        padding: 4px 8px;
        transition: none;
        border-radius: 0;
      }

      #workspaces button.active {
        background: @theme_selected_bg_color;
        color: @theme_selected_fg_color;
      }

      #workspaces button.urgent {
        color: @warning_color;
      }
    '';
  };
}
