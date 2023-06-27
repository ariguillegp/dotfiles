{ pkgs, ... }:

{
  xdg.configFile.i3 = {
    source = ./config/i3;
    recursive = true;
  };
}
