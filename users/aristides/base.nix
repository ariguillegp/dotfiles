{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    brave
    curl
    dig
    dos2unix
    flameshot
    gnupg
    htop
    jq
    lsof
    ncdu
    ripgrep
    rsync
    tldr
    tmux
    tree
    xclip
    zsh
  ];
}
