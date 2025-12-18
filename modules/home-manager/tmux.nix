{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    newSession = true;
    baseIndex = 1;
    escapeTime = 0;
    mouse = true;
    prefix = "`";
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";
    customPaneNavigationAndResize = false;
    disableConfirmationPrompt = true;
    tmuxinator.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
    extraConfig = ''
      set -g renumber-windows on
      set -g repeat-time 1000

      set -g pane-border-lines simple
      set -g pane-border-style fg=black,bright
      set -g pane-active-border-style fg=magenta

      set -g status-style bg=default,fg=black,bright
      set -g status-left ""
      set -g status-right "#[fg=black,bright]#S"

      set -g window-status-format " ●"
      set -g window-status-current-format " ●"
      set -g window-status-current-style "#{?window_zoomed_flag,fg=yellow,fg=magenta,nobold}"
      set -g window-status-bell-style "fg=red,nobold"

      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
    '';
  };
}
