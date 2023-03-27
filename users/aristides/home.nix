{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./direnv.nix
    ./exa.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "aristides";
    homeDirectory = "/home/aristides";

    packages = with pkgs; [
      alacritty
      awscli2
      bat
      brave
      cargo
      codespell
      curl
      deadnix
      dig
      discord
      docker-compose
      dos2unix
      fish
      flameshot
      flyctl
      gcc12
      git
      gitlint
      git-crypt
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
      signal-desktop
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
