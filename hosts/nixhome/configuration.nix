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

  # Install Iosevka nerdfont
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
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

  networking.hostName = "nixhome"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Enable the X11 windowing system.
  services.displayManager.defaultSession = "none+i3"; # No desktop environment and i3 as the window manager

  # List services that you want to enable:
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    # Config options available here: https://search.nixos.org/options?channel=22.11&size=50&sort=relevance&type=packages&query=i3
    windowManager.i3 = {
      # Whether to enable i3 window manager.
      enable = true;
      # i3 package to use.
      package = pkgs.i3;
      # Extra packages to be installed system wide.
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock-fancy-rapid
      ];
      # Path to the i3 configuration file. If left at the default value, $HOME/.i3/config will be used.
      configFile = "/home/aristides/.dotfiles/modules/home-manager/config/i3/config";
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
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
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
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
      #l = "eza";
      #ls = "eza"; # ls
      #ll = "eza -lbF --git"; # list, size, type, git
      #llm = "eza -lbGd --git --sort=modified"; # long list, modified date sort
      #la = "eza -lbhHigUmuSa --time-style=long-iso --git --color-scale"; # all list
      #lx = "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale"; # all + extended list
      #lS = "eza -1"; # one column, just names
      #lt = "eza --tree --level=2"; # tree
    };
    shellAbbrs = {
      k = "kubectl";
      v = "nvim";
      V = "sudo nvim";
      g = "git";
      z = "zellij";
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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
  system.stateVersion = "23.05"; # Did you read the comment?
}
