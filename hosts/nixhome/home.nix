{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/direnv.nix
    ../../modules/home-manager/eza.nix
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/hyprlock.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/neovim.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/xdg-portals.nix
    ../../modules/home-manager/wezterm.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "aristides";
    homeDirectory = "/home/aristides";

    packages = with pkgs; [
      # hyprland
      xfce.thunar
      dunst # notification daemon
      hyprshot # screenshots
      libnotify # needed by dunst
      rofi-wayland # app launcher
      swww # wallpaper
      waybar # desktop bar
      # hyprland
      arandr
      awscli2
      bat
      blueman
      bluez
      bluez-alsa
      brave
      bun
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
      flyctl
      gcc12
      gci
      git
      git-cliff
      gitlint
      git-crypt
      go
      gofumpt
      golangci-lint
      gnumake
      gnupg
      hadolint
      htop
      jq
      just
      kind
      kubectl
      kubernetes-helm
      libreoffice
      lsof
      mage
      ncdu
      nodejs_20
      okular
      pfetch
      pgadmin4
      playerctl
      python311
      pre-commit
      rsync
      sof-firmware
      ssm-session-manager-plugin
      tailscale
      terraform
      tldr
      tmux
      tree
      unzip
      wezterm
      xclip
      zip
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
