{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./aws.nix
    ./git.nix
    ./neovim.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "aristides";
    homeDirectory = "/home/aristides";

    packages = with pkgs; [
      qbittorrent
      protonvpn-gui
      bat
      brave
      cargo
      codespell
      curl
      dig
      discord
      dos2unix
      fish
      flameshot
      gcc12
      google-chrome
      go
      gnumake
      gnupg
      htop
      jq
      lsof
      ncdu
      nodejs-19_x
      pfetch
      python311
      ranger
      ripgrep
      rsync
      slack
      terraform
      tldr
      tmux
      tree
      unzip
      xclip
      zsh
    ];

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
  };

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "ansi";
        italic-text = "always";
      };
    };

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    exa = {
      enable = true;
      enableAliases = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
