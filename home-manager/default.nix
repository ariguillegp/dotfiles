{ pkgs, ... }:

{
  imports = [
    #./alacritty.nix
    #./bat.nix
    #./direnv.nix
    #./exa.nix
    #./git.nix
    ./neovim.nix
    #./tmux.nix
    ./i3.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "aristides";
    homeDirectory = "/home/aristides";

    packages = with pkgs; [
      # alacritty
      # arandr
      awscli2
      # bat
      # brave
      # cargo-watch
      # curl
      # dagger
      dig
      # docker-compose
      # dos2unix
      # fd
      # fish
      # flameshot
      flyctl
      gcc12
      # git
      # git-crypt
      # go
      gnumake
      gnupg
      # dmenu
      kubernetes-helm
      # htop
      # jq
      kind
      # kubectl
      # lazygit
      libreoffice
      # lsof
      mage
      # ncdu
      # nodejs
      okular
      picom
      python311
      ranger
      # ripgrep
      # rsync
      # signal-desktop
      terraform
      tldr
      tmux
      # tree
      # unzip
      # xclip
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
