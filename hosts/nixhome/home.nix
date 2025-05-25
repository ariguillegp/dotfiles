{ pkgs, paths, identities, ... }:

let
  vars = import ../../modules/home-manager/variables.nix;
in
{
  imports = [
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/direnv.nix
    ../../modules/home-manager/eza.nix
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/hyprlock.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/neovim.nix
    ../../modules/home-manager/ssh.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/xdg-portals.nix
    ../../modules/home-manager/wezterm.nix
  ];

  # to use variables within modules
  _module.args = vars;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "${identities.userName}";
    homeDirectory = "${paths.home}";
    file = {
      # Create the hooks directory and pre-commit script
      ".config/git/hooks/pre-commit" = {
        text = ''
          #!/usr/bin/env bash
          core-precommit
        '';
        executable = true;
       };
      # Ensure your project directories exist
      "Projects/personal/.gitkeep".text = "";
      "Projects/cc/.gitkeep".text = "";
    };

    packages = with pkgs; [
      awscli2
      bat
      blueman
      bluez
      bluez-alsa
      brave
      bun
      cobra-cli
      codespell
      curl
      dig
      docker-compose
      dos2unix
      dunst # notification daemon
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
      hyprshot # screenshots
      jq
      just
      kind
      kubectl
      kubernetes-helm
      libreoffice
      libnotify # needed by dunst
      lsof
      ncdu
      nodejs_20
      okular
      pfetch
      pgadmin4
      playerctl
      python311
      pre-commit
      rsync
      rofi-wayland # app launcher
      sof-firmware
      ssm-session-manager-plugin
      swww # wallpaper
      tailscale
      terraform
      tldr
      tmux
      tree
      unzip
      wezterm
      xfce.thunar
      xclip
      waybar # desktop bar
      zip

      (writeShellScriptBin "core-precommit" ''
        #!/usr/bin/env bash

        echo -e "\n=== Git Identity Check ==="
        current_user=$(git config user.name)
        current_email=$(git config user.email)
        current_signing_key=$(git config user.signingkey)
        current_dir=$(pwd)

        echo "Directory: $current_dir"
        echo "User: $current_user"
        echo "Email: $current_email"
        echo "Signing key: $current_signing_key"

        echo -e "\n=== SSH Agent Status ==="
        # Check if SSH agent is running
        if [ -z "$SSH_AUTH_SOCK" ]; then
          echo "ERROR: SSH agent is not running"
          echo "HINT: Start SSH agent with: eval \$(ssh-agent -c)"
          exit 1
        fi
        echo "SUCCESS: SSH agent is running"

        # Check if SSH agent socket exists and is accessible
        if [ ! -S "$SSH_AUTH_SOCK" ]; then
          echo "ERROR: SSH agent socket not accessible: $SSH_AUTH_SOCK"
          echo "HINT: Restart SSH agent or check SSH_AUTH_SOCK variable"
          exit 1
        fi
        echo "SUCCESS: SSH agent socket is accesible"

        # Determine expected identity based on directory
        expected_email=""
        expected_key=""
        required_ssh_key=""
        github_host=""
        context=""

        if [[ "$current_dir" == *"/Projects/cc/"* ]]; then
          expected_email="${identities.cc.email}"
          expected_key="${identities.cc.sshPubKey}"
          required_ssh_key="${identities.cc.sshPrivKey}"
          github_host="${identities.cc.githubHost}"
          context="${identities.cc.context}"
        elif [[ "$current_dir" == *"/Projects/personal/"* ]] || [[ "$current_dir" == *"dotfiles"* ]]; then
          expected_email="${identities.personal.email}"
          expected_key="${identities.personal.sshPubKey}"
          required_ssh_key="${identities.personal.sshPrivKey}"
          github_host="${identities.personal.githubHost}"
          context="${identities.personal.context}"
        else
          echo "INFO: Directory not in known project structure - skipping identity validation"
          exit 0
        fi

        echo -e "\n=== Email Identity Check ==="
        if [[ "$current_email" != "$expected_email" ]]; then
          echo "ERROR: Wrong email identity!"
          echo "  Current:  $current_email"
          echo "  Expected: $expected_email"
          echo "HINT: Fix with: git config user.email '$expected_email'"
          exit 1
        fi
        echo "SUCCESS: Email identity check passed"

        echo -e "\n=== SSH Keys Check ==="
        if [[ "$current_signing_key" != "$expected_key" ]]; then
          echo "ERROR: Wrong signing key!"
          echo "  Current:  $current_signing_key"
          echo "  Expected: $expected_key"
          echo "HINT: Fix with: git config user.signingkey '$expected_key'"
          exit 1
        fi
        echo "SUCCESS: Signing key check passed"

        # Check if the required SSH key is loaded in the agent
        if [[ "$ssh_keys_loaded" == true ]]; then
          key_fingerprint=$(ssh-keygen -lf "$expected_key" 2>/dev/null | awk '{print $2}')

          if [[ -n "$key_fingerprint" ]]; then
            if ! ssh-add -l | grep -q "$key_fingerprint"; then
              echo "WARNING: Required SSH key not loaded in agent"
              echo "  Required key: $required_ssh_key"
              echo "  Fingerprint: $key_fingerprint"
              echo "HINT: Load with: ssh-add $required_ssh_key"
              echo "INFO: Continuing anyway - Git may prompt for passphrase"
            else
              echo "SUCCESS: Required SSH key is loaded in agent"
            fi
          fi
        fi

        echo -e "\n=== Commit Signing Check ==="
        if git log -1 --pretty=format:"%G?" 2>/dev/null | grep -q "G"; then
          echo "SUCCESS: Last commit was properly signed"
        else
          signature_status=$(git log -1 --pretty=format:"%G?" 2>/dev/null || echo "No commits")
          echo "WARNING: Last commit signature status: $signature_status"
        fi

        echo -e "\n=== SSH GitHub Auth Check ==="
        if timeout 10 ssh -T git@$github_host -o ConnectTimeout=5 -o BatchMode=yes 2>&1 | grep -q "successfully authenticated"; then
          echo "SUCCESS: SSH authentication to $github_host successful"
        else
          echo "WARNING: SSH authentication test failed"
          echo "HINT: You may need to add the SSH key to GitHub or check your connection"
          echo "HINT: Test manually with: ssh -T git@$github_host"
          # Don't exit - the commit might still work
        fi

        echo -e "SUCCESS: Pre-commit identity check passed for '$context' context\n"
      '')
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
