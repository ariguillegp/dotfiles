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
      #defaultEditor = true;


      ## install needed binaries here
      #extraPackages = with pkgs; [
      #  # used to compile tree-sitter grammar
      #  tree-sitter

      #  # installs different langauge servers for neovim-lsp
      #  # have a look on the link below to figure out the ones for your languages
      #  # https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
      #  nodePackages.typescript nodePackages.typescript-language-server
      #  gopls
      #  nodePackages.pyright
      #  rust-analyzer
      #];
      #plugins = with pkgs.vimPlugins; [
      #  # you can use plugins from the pkgs
      #  vim-which-key
      #  fugitive

      #  ## or you can use our function to directly fetch plugins from git
      #  #(plugin "neovim/nvim-lspconfig")
      #  #(plugin "hrsh7th/nvim-compe") # completion
      #  #(plugin "Raimondi/delimitMate") # auto bracket

      #  ## this installs the plugin from 'lua' branch
      #  #(pluginGit "lua" "lukas-reineke/indent-blankline.nvim")

      #  ## syntax highlighting
      #  #(plugin "nvim-treesitter/nvim-treesitter")
      #  #(plugin "p00f/nvim-ts-rainbow") # bracket highlighting
      #];
    };
  };
}
