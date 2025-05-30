{
  wayland.windowManager.hyprland = {
    # allow home-manager to configure hyprland.
    enable = true;

    # hyprland settings.
    settings = {
      # Monitor settings, i.e positioning, resolution, etc.
      # https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "eDP1, 1920x1080@60, 0x0, 1"
      ];

      # Environment variables
      # https://wiki.hyprland.org/Configuring/Environment-variables/
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # Look and feel
      # https://wiki.hyprland.org/Configuring/Variables/

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 2;
        gaps_out = 2;
        border_size = 1;

        # # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 5;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 0.7;

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = [
          "myBezier,0.05,0.9,0.1,1.05"
        ];
        animation = [
          "windows,1,7,myBezier"
          "windowsOut,1,7,default,popin 80%"
          "border,1,10,default"
          "borderangle,1,8,default"
          "fade,1,7,default"
          "workspaces,1,6,default"
        ];
      };

      # https://wiki.hyprland.org/Configuring/Dwindle-Layout/
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the key
        preserve_split = true; # You probably want this
      };

      # https://wiki.hyprland.org/Configuring/Master-Layout/
      master = {
        new_status = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false; # If true disables the random hyprland logo/anime girl background
      };

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = false;
      };

      # https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      # Set programs that you use↴
      # https://wiki.hyprland.org/Configuring/Keywords/
      "$terminal" = "wezterm";
      "$webBrowser" = "brave";
      "$fileManager" = "thunar";
      "$messenger" = "signal";
      "$menu" = "rofi -show drun -show-icons";

      # Autostart
      exec-once = [
        "[workspace 1 silent] $terminal"
        "[workspace 2 silent] $webBrowser"
        "[workspace 4 silent] $messenger"
      ];

      windowrulev2 = [
        "workspace 1, class:^(wezterm)$"
        "workspace 2, class:^(brave-browser)$"
        "workspace 3, class:^(thunar)$"
        "workspace 4, class:^(signal)$"
      ];

      # Keybindings
      # https://wiki.hyprland.org/Configuring/Keywords/
      "$mod" = "SUPER"; # Sets Windows key as main modifier.

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more.
      bind =
        [
          "$mod, RETURN, exec, $terminal"
          "$mod, Q, killactive"
          "$mod, M, exit"
          "$mod, L, exec, hyprlock"
          "$mod, R, exec, $menu"
          "$mod, E, exec, $fileManager"
          "$mod, V, exec, togglefloating"
          "$mod, B, exec, $webBrowser"
          "$mod, P, exec, pseudo" # dwindle
          "$mod, J, exec, togglesplit" # dwindle
          "$mod, S, togglespecialworkspace, magic"
          "$mod SHIFT, S, movetoworkspace, special:magic"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          # Screenshot a window (mod + PrtSc)
          "$mod, PRINT, exec, hyprshot -m window"
          # Screenshot a monitor (PrtSc)
          ", PRINT, exec, hyprshot -m region"
          # Screenshot a region (Shift + mod + PrtSc)
          "$mod SHIFT, PRINT, exec, hyprshot -m output"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        # media controls
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"

        # volume
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindel = [
        # volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"

        # backlight
        ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
        ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
      ];
    };
  };
}
