{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    newSession = true;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'

          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "left"
          set -g @catppuccin_window_middle_separator "█ "

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_default_color "#{thm_orange}"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_window_current_color "#{thm_blue}"

          set -g @catppuccin_status_modules_right "directory session host date_time"
          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"
      
          set -g @catppuccin_status_fill "icon"

          set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];
  };
}
