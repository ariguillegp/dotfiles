{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    git
    git-crypt
  ];

  programs.git = {
    enable = true;
    userName  = "Aristides Gonzalez";
    userEmail = "ariguille.gp@gmail.com";
  };
}
