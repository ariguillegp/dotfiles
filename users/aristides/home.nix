{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
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
      arandr
      awscli2
      bat
      brave
      cargo
      cargo-watch
      codespell
      curl
      dagger
      deadnix
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
      gnumake
      gnupg
      kubernetes-helm
      htop
      jq
      kind
      kubectl
      lazygit
      libreoffice
      lsof
      mage
      ncdu
      nodejs_20
      okular
      pfetch
      python311
      ranger
      ripgrep
      rsync
      rust-analyzer
      signal-desktop
      terraform
      tldr
      tmux
      tree
      unzip
      xclip
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
