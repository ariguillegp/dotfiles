{
  # 1. Configure SSH Client (for Git authentication and general SSH)
  programs.ssh = {
    enable = true;
    # This option ensures an SSH agent is running.
    # It's generally well-supported in recent Home Manager versions.
    startAgent = true;

    # Define host aliases for different GitHub identities
    # This will generate ~/.ssh/config entries
    matchBlocks = {
      # Personal GitHub access
      "github.com-personal" = { # You can name this alias whatever you like
        hostName = "github.com";
        user = "git"; # Standard user for GitHub SSH
        identityFile = "~/.ssh/id_rsa"; # Path to your PERSONAL private SSH key
        identitiesOnly = "yes"; # Crucial: only use this specified key for this host
      };

      # Work GitHub access
      "github.com-work" = { # Alias for your work identity
        hostName = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_rsa_work"; # Path to your WORK private SSH key
        identitiesOnly = "yes";
      };

      # Optional: A default github.com entry if you want one for unqualified URLs.
      # If you use this, decide which identity it should default to.
      # For clarity, always using specific aliases (github.com-personal, github.com-work)
      # in your Git remote URLs is often less ambiguous.
      # "github.com" = {
      #   hostName = "github.com";
      #   user = "git";
      #   identityFile = "~/.ssh/id_rsa"; # Defaults to personal, for example
      #   identitiesOnly = "yes";
      # };
    };
    # You can add other global SSH options here if needed
    # extraConfig = ''
    #   ControlMaster auto
    #   ControlPath ~/.ssh/sockets/%r@%h-%p
    #   ControlPersist 600
    # '';
  };
}
