{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  xdg.configFile.nvim = {
    source = ./config/nvim;
    recursive = true;
  };
}
