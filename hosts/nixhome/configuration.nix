# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable Flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Install IosevkaTerm nerdfont
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
  ];

  # Bootloader.
  boot.loader = {
    timeout = 1;
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 3;
    efi.canTouchEfiVariables = true;
  };

  # Prevents weird behavior introduced pre 23.11
  # ref: https://github.com/NixOS/nixpkgs/issues/254807
  boot.swraid.enable = false;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixhome";
  networking.extraHosts =
  ''
    100.122.8.81 demo.crescentcyber.com
  '';

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Trying Hyprland (Wayland based compositor)
  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # temporary until I can confidently get rid of X11
  };

  # # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # # Enable the X11 windowing system.
  # services.displayManager.defaultSession = "none+i3"; # No desktop environment and i3 as the window manager
  #
  # # List services that you want to enable:
  # services.xserver = {
  #   enable = true;
  #
  #   desktopManager = {
  #     xterm.enable = false;
  #   };
  #
  #   # Config options available here: https://search.nixos.org/options?channel=22.11&size=50&sort=relevance&type=packages&query=i3
  #   windowManager.i3 = {
  #     # Whether to enable i3 window manager.
  #     enable = true;
  #     # i3 package to use.
  #     package = pkgs.i3;
  #     # Extra packages to be installed system wide.
  #     extraPackages = with pkgs; [
  #       dmenu
  #       i3status
  #       i3lock-fancy-rapid
  #     ];
  #     # Path to the i3 configuration file. If left at the default value, $HOME/.i3/config will be used.
  #     configFile = "/home/aristides/.dotfiles/modules/home-manager/config/i3/config";
  #   };
  # };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # Connect to tailscale network.
  services.tailscale.enable = false;

  # # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth setup
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    dunst # notification daemon
    git
    kitty # trying this out -- it seems cool
    libnotify # needed by dunst
    rofi-wayland # app launcher
    swww # wallpaper
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    waybar # desktop bar
  ];

  # Add/Enable docker daemon
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.fish;
    users.aristides = {
      isNormalUser = true;
      initialPassword = "secret";
      extraGroups = [ "wheel" "docker" "networkmanager" ]; # Enable ‘sudo’ for the user.
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      cat = "bat --paging=never --style=plain";
    };
    shellAbbrs = {
      k = "kubectl";
      v = "nvim";
      V = "sudo nvim";
      g = "git";
    };
  };

  # Automatic upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    rebootWindow = {
      lower = "01:00";
      upper = "04:00";
    };
    channel = "https://nixos.org/channels/nixos-24.05";
  };

  # Automatic garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 7d";
  nix.settings.auto-optimise-store = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05";
