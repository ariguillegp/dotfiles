{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      plugins = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ];
    };
  };

  xdg.configFile.nvim = {
    source = ./config/nvim;
    recursive = true;
  };
}
