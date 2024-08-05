{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        padding = {
          x = 2;
          y = 2;
        };
      };

      font = {
        size = 7.0;

        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };

        normal.family = "Iosevka Nerd Font";
        bold.family = "Iosevka Nerd Font";
        italic.family = "Iosevka Nerd Font";
      };

      colors = {
        # Default colors
        primary = {
          background = "#1a1b26";
          foreground = "#a9b1d6";
        };

        # Normal colors
        normal = {
          black = "#32344a";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#ad8ee6";
          cyan = "#449dab";
          white = "#787c99";
        };

        # Bright colors
        bright = {
          black = "#444b6a";
          red = "#ff7a93";
          green = "#b9f27c";
          yellow = "#ff9e64";
          blue = "#7da6ff";
          magenta = "#bb9af7";
          cyan = "#0db9d7";
          white = "#acb0d0";
        };

        # scrolling = {
        #   # Maximum number of lines in the scrollback buffer.
        #   # Specifying '0' will disable scrolling.
        #   history = 10000;
        #
        #   # Number of lines the viewport will move for every line scrolled when
        #   # scrollback is enabled (history > 0).
        #   multiplier = 10;
        # };

        ## If `true`, bold text is drawn using the bright color variants.
        draw_bold_text_with_bright_colors = true;

        # selection = {
        #   save_to_clipboard = true;
        # };

        # live_config_reload = true;

        # debug = {
        #   print_events = true;
        # };
      };
    };
  };
}
