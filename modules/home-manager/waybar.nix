# In your home.nix
{ pkgs, ... }:

{
  # ... other configurations like fonts, packages from above

  programs.waybar = {
    enable = true;
    package = pkgs.waybar; # Or pkgs.waybar-hyprland if you prefer
  };
}
