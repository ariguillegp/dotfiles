{ pkgs, pkgs-unstable, paths, identities, ... }:

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
    ../../modules/home-manager/xdg-portals.nix
    ../../modules/home-manager/waybar.nix
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

    packages = (
      with pkgs; [
        awscli2
        bat
        blueman
        bluez
        bluez-alsa
        google-chrome
        curl
        dig
        docker-compose
        dos2unix
        dunst # notification daemon
        fd
        fish
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
        kdePackages.okular
        pfetch
        pkgs-unstable.code-cursor
        playerctl
        python311
        pre-commit
        rsync
        rofi-wayland # app launcher
        signal-desktop
        sof-firmware
        ssm-session-manager-plugin
        swww # wallpaper
        tailscale
        terraform
        tldr
        tree
        unzip
        wezterm
        xfce.thunar
        xclip
        waybar # desktop bar
        zip

        (writeShellScriptBin "git-clone-worktree" ''
          #!/usr/bin/env bash
          set -e

          # git-clone-worktree - Clone a repository ready for git worktrees
          #
          # Usage:
          #   git clone-worktree <repo-url> [directory-name]
          #
          # Examples:
          #   git clone-worktree git@github.com:user/repo.git
          #   git clone-worktree https://github.com/user/repo.git my-project

          show_usage() {
              echo "Usage: git clone-worktree <repo-url> [directory-name]"
              echo ""
              echo "Clone a repository in worktree-ready format with:"
              echo "  - Bare repository in .bare/"
              echo "  - Ready to create worktrees as siblings"
              echo ""
              echo "Examples:"
              echo "    git clone-worktree git@github.com:user/repo.git"
              echo "    git clone-worktree https://github.com/user/repo.git my-project"
          }

          # Validate arguments
          if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
              show_usage
              exit 0
          fi

          url="$1"

          # Extract repository name from URL
          basename=$(basename "$url")
          default_name="''${basename%.*}"  # Remove .git extension if present
          name="''${2:-$default_name}"

          # Validate inputs
          if [ -z "$url" ]; then
              echo "Error: Repository URL is required"
              show_usage
              exit 1
          fi

          if [ -d "$name" ]; then
              echo "Error: Directory '$name' already exists"
              exit 1
          fi

          echo "Setting up worktree repository: $name"
          echo "Source: $url"

          # Create project directory
          mkdir "$name"
          cd "$name"

          echo "Cloning bare repository..."
          # Clone as bare repository
          git clone --bare "$url" .bare

          # Create .git file pointing to bare repo
          echo "gitdir: ./.bare" > .git

          echo "Configuring repository..."
          # Configure remote fetch to get all branches
          git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

          # Fetch all branches
          echo "Fetching all branches..."
          git fetch origin

          # Get default branch name
          default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || echo "main")

          # Check if default branch exists, fallback to main, then master
          if ! git show-ref --verify --quiet "refs/remotes/origin/$default_branch"; then
              if git show-ref --verify --quiet "refs/remotes/origin/main"; then
                  default_branch="main"
              elif git show-ref --verify --quiet "refs/remotes/origin/master"; then
                  default_branch="master"
              else
                  # Get the first available branch
                  default_branch=$(git branch -r | head -n1 | sed 's/.*origin\///' | tr -d ' ')
              fi
          fi

          echo "Repository setup complete!"
          echo ""
          echo "Structure created:"
          echo "   $name/"
          echo "   ├── .bare/          # Bare repository"
          echo "   └── .git            # Points to .bare"
          echo ""
          echo "Next steps:"
          echo "   git worktree add $default_branch $default_branch    # Create main worktree"
          echo "   git worktree add -b feature/new feature             # Create feature branch"
          echo ""
          echo "Useful commands:"
          echo "   git worktree list                    # List all worktrees"
          echo "   git worktree add <branch> <path>     # Add existing branch"
          echo "   git worktree add -b <branch> <path>  # Create new branch"
          echo "   git fetch origin                     # Fetch updates"
        '')

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
      ]);

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
