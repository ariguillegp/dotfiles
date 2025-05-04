{ pkgs, ... }:

{
  # XDG Desktop Portal handles a lot of stuff for your desktop, like file pickers,
  # screensharing, etc.
  xdg.portal = {
    enable = true;

    config = {
      common = {
        default = [ "gtk" ];
      };
      # For example, for Hyprland:
      hyprland = {
        default = [ "hyprland" "gtk" ];
      };
    };

    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
}
