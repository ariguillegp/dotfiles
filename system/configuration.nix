# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-0ebd0a76-f4eb-44c6-ab71-131acfe72fb2".device = "/dev/disk/by-uuid/0ebd0a76-f4eb-44c6-ab71-131acfe72fb2";
  boot.initrd.luks.devices."luks-0ebd0a76-f4eb-44c6-ab71-131acfe72fb2".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nixdso"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
 
  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput = {
    enable = true;
    touchpad.tapping = false; # don't like tapping in the touchpad
  };

  # Add/Enable docker daemon
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.aristides= {
      isNormalUser = true;
      initialPassword = "secret";
      extraGroups = [ "wheel" "docker" "networkmanager"]; # Enable ‘sudo’ for the user.
    };
  };

  programs.zsh = {
    enable = true;
     # Set some aliases
    shellAliases = {
      v = "nvim";
      V = "sudo nvim";
      vim = "nvim";
      cat = "bat --paging=never --style=plain";
    };
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "man" ];
    };
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    
    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
      # No desktop environment and i3 as the window manager
      defaultSession = "none+i3"; 
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock-fancy-rapid
      ];
      # configFile = "path to i3 config file"
    };
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable Flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Automatic upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    rebootWindow = {
      lower = "01:00";
      upper = "04:00";
    };
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # Automatic garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 7d";
  nix.autoOptimiseStore = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
