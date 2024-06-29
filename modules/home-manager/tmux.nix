{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'

          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "left"
          set -g @catppuccin_window_middle_separator "█ "

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules_right "directory session host date_time"
          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"
      
          set -g @catppuccin_status_fill "icon"

          set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
    ];
    # extraConfig = '''';
  };
}
