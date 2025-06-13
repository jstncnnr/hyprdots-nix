{osConfig, ...}: let
  terminalExe = let
    inherit (osConfig.hyprdots.terminal.meta) mainProgram;
    fallback = osConfig.hyprdots.terminalExecutable;
  in
    if mainProgram != null
    then mainProgram
    else if fallback != null
    then fallback
    else throw "Error: 'hyprdots.terminal' does not export a main program. Please set 'hyprdots.terminalExecutable' to the correct binary.";
in {
  imports = [
    ./animations.nix
    ./decoration.nix
    ./dwindle.nix
    ./environment.nix
    ./general.nix
    ./gestures.nix
    ./input.nix
    ./master.nix
    ./misc.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
      "$mod" = "SUPER";

      bind =
        [
          "$mod, Q, killactive,"
          "$mod, M, exec, uwsm stop"
          "$mod, V, togglefloating,"
          "$mod, P, pseudo,"
          "CTRL ALT, C, centerwindow,"

          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"

          "$mod, S, togglespecialworkspace, magic"
          "$mod SHIFT, S, movetoworkspacesilent, special:magic"

          "$mod, Return, exec, uwsm app -- ${terminalExe}"
        ]
        ++ (
          builtins.concatLists
          (
            builtins.genList
            (
              i: let
                workspace = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString workspace}"
                "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString workspace}"
              ]
            )
            9
          )
        );

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
      ];
    };
  };

  services = {
    hyprpolkitagent.enable = true;
    playerctld.enable = true;
  };
}
