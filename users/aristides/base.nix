{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    bat
    brave
    curl
    dig
    discord
    dos2unix
    flameshot
    gnupg
    htop
    jq
    lsof
    ncdu
    ranger
    ripgrep
    rsync
    slack
    terraform
    tldr
    tmux
    tree
    xclip
    zsh
  ];
}
