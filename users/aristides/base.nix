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
    ripgrep
    rsync
    slack
    tldr
    tmux
    tree
    xclip
    zsh
  ];
}
