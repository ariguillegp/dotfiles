{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      # plugins = [
      #   pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      # ];
    };
  };

  xdg.configFile.nvim = {
    source = ./config/nvim;
    recursive = true;
  };
}
