{ pkgs, ... }: {
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
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    tmuxinator.enable = true;
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
    '';
    # plugins = with pkgs.tmuxPlugins; [
    #   {
    #     plugin = catppuccin;
    #     extraConfig = ''
    #       set -g @catppuccin_flavour 'mocha'
    #
    #       set -g @catppuccin_window_right_separator "█ "
    #       set -g @catppuccin_window_number_position "left"
    #       set -g @catppuccin_window_middle_separator "█ "
    #
    #       set -g @catppuccin_window_default_fill "number"
    #       set -g @catppuccin_window_default_text "#W"
    #
    #       set -g @catppuccin_window_default_color "#{thm_orange}"
    #
    #       set -g @catppuccin_window_current_fill "number"
    #       set -g @catppuccin_window_current_text "#W"
    #
    #       set -g @catppuccin_window_current_color "#{thm_blue}"
    #
    #       set -g @catppuccin_status_modules_right "directory session host date_time"
    #       set -g @catppuccin_status_left_separator "█"
    #       set -g @catppuccin_status_right_separator "█"
    #
    #       set -g @catppuccin_status_fill "icon"
    #
    #       set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
    #       set -g @catppuccin_directory_text "#{pane_current_path}"
    #     '';
    #   }
    #   {
    #     plugin = resurrect;
    #     extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    #   }
    #   {
    #     plugin = continuum;
    #     extraConfig = ''
    #       set -g @continuum-restore 'on'
    #       set -g @continuum-save-interval '10'
    #     '';
    #   }
    # ];
  };
}
