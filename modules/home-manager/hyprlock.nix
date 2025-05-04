{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 0;
        no_fade_in = false;
        no_fade_out = false;
      };

      background = {
        monitor = "";
        path = "screenshot";
        blur_passes = 2;        # Number of blur passes (increase for more blur)
        blur_size = 5;          # Blur radius (higher = stronger blur)
        color = "rgba(25, 20, 20, 1.0)";  # Fallback color if screenshot fails
      };

      input-field = {
        monitor = "";
        size = "300, 50";
        outline_thickness = 3;
        dots_size = 0.3;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgb(200, 200, 200)";
        inner_color = "rgb(100, 100, 100)";
        font_color = "rgb(255, 255, 255)";
        placeholder_text = "<i>Enter Password...</i>";
        hide_input = true;
        rounding = -1;
        fail_color = "rgb(255, 50, 50)";
        fail_text = "<i>Authentication Failed ($ATTEMPTS)</i>";
      };

      label = {
        monitor = "";
        text = "Locked - $TIME";
        color = "rgba(255, 255, 255, 0.9)";
        font_size = 24;
        font_family = "Noto Sans";
        position = "0, 80";
        halign = "center";
        valign = "center";
      };
    };
  };
}
