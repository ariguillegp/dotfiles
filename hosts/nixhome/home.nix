{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/direnv.nix
    ../../modules/home-manager/eza.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/neovim.nix
    ../../modules/home-manager/tmux.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "aristides";
    homeDirectory = "/home/aristides";

    packages = with pkgs; [
      alacritty
      arandr
      awscli2
      bat
      blueman
      bluez
      bluez-alsa
      brave
      cargo
      cargo-watch
      cobra-cli
      codespell
      curl
      dig
      docker-compose
      dos2unix
      fd
      fish
      flameshot
      flyctl
      gcc12
      git
      gitlint
      git-crypt
      go
      golangci-lint
      gnumake
      gnupg
      kubernetes-helm
      htop
      jq
      kind
      kubectl
      libreoffice
      lsof
      mage
      ncdu
      nodejs_20
      okular
      pfetch
      python311
      ranger
      rsync
      signal-desktop
      terraform
      tldr
      tmux
      tree
      unzip
      xclip
      zellij
    ];

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
