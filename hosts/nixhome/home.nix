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
      gh
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

  programs.ssh = {
    enable = true;
    # Optional: if you want Home Manager to manage starting the SSH agent.
    # If you manage it via systemd user session or shell startup, you might set this to false or omit it.
    startAgent = true;

    # This is where you define your host-specific configurations.
    # It will generate entries in ~/.ssh/config
    matchBlocks = {
      # Alias for your personal GitHub account (ariguillegp)
      "github.com-personal" = { # You can name this alias whatever you like
        hostName = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_rsa"; # Path to your personal SSH private key
        identitiesOnly = "yes"; # Important: only use this specified key
      };

      # Alias for your work GitHub account (aristides-cc)
      "github.com-cc" = { # Alias for your work identity
        hostName = "github.com";
        user = "git";
        identityFile = "~/.ssh/crescent_rsa"; # Path to your work SSH private key
        identitiesOnly = "yes";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
