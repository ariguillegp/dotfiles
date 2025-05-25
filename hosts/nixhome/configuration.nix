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
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Install IosevkaTerm nerdfont
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
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

  # Hyprlock needs PAM access to be able to authenticate the user back.
  security.pam.services.hyprlock = {};

  # # Force electron apps to use Wayland.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable GDM to start Hyprland-UWSM
  services.xserver = {
    enable = true;

    displayManager = {
      gdm.enable = true;
    };
  };

  # Connect to tailscale network.
  services.tailscale.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
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
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
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

  programs.ssh.startAgent = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function gcw --description "Git clone worktree and cd into the directory"
        if git-clone-worktree $argv
          set url $argv[1]
          set basename (basename "$url")
          if test -n "$argv[2]"
            set name $argv[2]
          else
            set name (string replace -r '\.git$' "" "$basename")
          end
          cd "$name"
        end
      end
    '';
    shellInit = ''
      # SSH Agent for Fish
      if not set -q SSH_AUTH_SOCK
        eval (ssh-agent -c)
      end
    '';
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
    channel = "https://nixos.org/channels/nixos-25.05";
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
}
