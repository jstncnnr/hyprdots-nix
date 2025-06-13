{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprdots = {
      enable = lib.mkEnableOption "Justin's Hyprland config";

      background = lib.mkOption {
        type = lib.types.nullOr lib.types.path;
        description = "The background image to use";
        default = null;
        apply = value:
          if value == null || lib.isDerivation value
          then value
          else "${value}";
      };

      terminal = lib.mkPackageOption pkgs "terminal emulator" {
        default = ["kitty"];
      };

      terminalExecutable = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = ''
          The name of the binary executable to use when `hyprdots.terminal` doesn't
          export a `mainProgram` to use.
        '';
      };
    };
  };

  config = lib.mkIf config.hyprdots.enable {
    # TODO: Style the greeter
    programs.regreet = {
      enable = lib.mkDefault true;
      settings = {
        background = lib.mkIf (config.hyprdots.background != null) {
          path = lib.mkDefault config.hyprdots.background;
        };

        widget.clock = {
          format = "%a %I:%M %p";
        };
      };
    };

    programs.hyprland = {
      enable = true;
      withUWSM = lib.mkDefault true;
    };

    xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = [
      config.hyprdots.terminal
    ];
  };
}
