{ pkgs, ... }:

{
  # Options are listed here: https://search.nixos.org/options?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=tmux
  programs.tmux = {
    # Whenever to configure tmux system-wide.
    enable = true;
    # Set the $TERM variable.
    terminal = "screen-256color";
    # Time in milliseconds for which tmux waits after an escape is input.
    escapeTime = 0;
    # Store tmux socket under /run, which is more secure than /tmp, but as a downside it doesn't survive user logout.
    secureSocket = true;
    # Ctrl following by this key is used as the main shortcut.
    shortcut = "Space";
    # Automatically spawn a session if trying to attach and none are running.
    newSession = true;
    # VI or Emacs style shortcuts.
    keyMode = "vi";
    # Maximum number of lines held in window history.
    historyLimit = 100000;
    # Use 24 hour clock.
    clock24 = true;
    # Base index for windows and panes.
    baseIndex = 1;
    # Resize the window to the size of the smallest session for which it is the current window.
    aggressiveResize = true;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    # Additional contents of /etc/tmux.conf
    extraConfig = ''
      # Re-number windows when one is closed
      set -g renumber-windows on

      # Adjust timeout for the messages on the status bar
      set-option -g display-time 5000

      # Show times longer than supposed
      set -g display-panes-time 2000

      # Highlight window when it has new activity
      setw -g monitor-activity on
      set -g visual-activity on

      # Easy-to-remember split pane commands
      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Vim-like pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Set titles
      set -g set-titles on
      set -g set-titles-string "#I:#P - #W - #T"

      # Mouse mode on -- copy text by dragging mouse
      set -g terminal-overrides 'xterm*:smcup@:rmcup@'
      set-option -g mouse on
    '';
  };
}
