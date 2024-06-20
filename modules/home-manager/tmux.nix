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
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator " | "

          set -g @catppuccin_window_default_fill "none"

          set -g @catppuccin_window_current_fill "all"

          set -g @catppuccin_status_modules_right "application session host date_time"
          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"
      
          set -g @catppuccin_status_fill "icon"

          set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
        '';
      }
    ];
    # extraConfig = '''';
  };
}
