{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = ",preferred,auto,1";

      misc = {
        disable_hyprland_logo = true;
        vrr = 0;
      };

      input = {
        natural_scroll = "0";
        touchpad = {
          natural_scroll = "1";
        };
        sensitivity = "0";
      };

      gestures = {
        workspace_swipe = "true";
        workspace_swipe_fingers = "3";
      };

      general = with config.colorScheme.palette; {
        layout = "master";
        apply_sens_to_raw = "0";
        gaps_in = "3";
        gaps_out = "5";
        border_size = "2";
        "col.active_border" = "0xFF${base05}";
        "col.inactive_border" = "0xFF${base00}";
      };

      decoration = {
        rounding = "4";
        active_opacity = "1.0";
        inactive_opacity = "1.0";
        fullscreen_opacity = "1.0";
        blur = {
          enabled = "false";
        };
      };

      exec-once = [
        "waybar"
        "${pkgs.swww}/bin/swww img ~/Pictures/Wallpapers/background.png --transition-type any"
      ];

      windowrulev2 = [
        "float, class:(steam), title:(Friends List)"
        "float, class:(steam), title:(Special Offers)"
        "float, class:(steam), title:(Steam Settings)"
        "float, class:(steam), title:(好友列表)"
        "float, class:(steam), title:(特惠)"
        "float, class:(steam), title:(Steam 设置)"
      ];

      "$term" = "kitty";
      "$launch" = "wofi --show drun --prompt 'Search...'";
      "$clipboard" = "cliphist list | wofi --dmenu | cliphist decode | wl-copy";
      "$randomwallpaper" = "${pkgs.swww}/bin/swww img $(find ~/Pictures/Wallpapers/. -name '*.png' | shuf -n1) --transition-type any";
      "$lockscreen" = "hyprlock";
      "$colorpicker" = "hyprpicker";
      "$screenshot" = "grimblast";
      "$filemanager" = "thunar";
      "$editor" = "nvim";
      "$browser" = "firefox";
      "$music" = "$term -e ncmpcpp";
      "$note" = "obsidian";

      bind = [
        # APPs
        "ALT,Return,exec,$term"
        "ALTSHIFT,Return,exec,$term tmux attach"
        "ALT,D,exec,$launch"
        "ALT,E,exec,$filemanager"
        "ALT,C,exec,$clipboard"
        "ALT,G,exec,$browser"
        "ALT,M,exec,$music"
        "ALT,O,exec,$note"
        "ALT,B,exec,waybar"
        "ALT,T,exec,killall -SIGUSR1 .waybar-wrapped"
        "ALT,P,exec,$colorpicker"
        "SUPER,L,exec,$lockscreen"
        "ALT,S,exec,$screenshot --notify copysave area"
        "ALT,W,exec,$randomwallpaper"

        # Hyprland
        "ALTSHIFT,Q,killactive"
        "ALTSHIFT,x,exit"
        "ALT,F,fullscreen"
        "ALT,space,togglefloating"

        # Focus
        "ALT,left,movefocus,l"
        "ALT,right,movefocus,r"
        "ALT,up,movefocus,u"
        "ALT,down,movefocus,d"
        "ALT,H,movefocus,l"
        "ALT,L,movefocus,r"
        "ALT,K,movefocus,u"
        "ALT,J,movefocus,d"

        # Move
        "ALTSHIFT,left,movewindow,l"
        "ALTSHIFT,right,movewindow,r"
        "ALTSHIFT,up,movewindow,u"
        "ALTSHIFT,down,movewindow,d"
        "ALTSHIFT,H,movewindow,l"
        "ALTSHIFT,L,movewindow,r"
        "ALTSHIFT,K,movewindow,u"
        "ALTSHIFT,J,movewindow,d"

        # Workspaces
        "ALT,1,workspace,1"
        "ALT,2,workspace,2"
        "ALT,3,workspace,3"
        "ALT,4,workspace,4"
        "ALT,5,workspace,5"
        "ALT,6,workspace,6"
        "ALT,7,workspace,7"
        "ALT,8,workspace,8"
        "ALT,9,workspace,9"
        "ALT,0,workspace,10"

        # Send to Workspaces
        "ALTSHIFT,1,movetoworkspace,1"
        "ALTSHIFT,2,movetoworkspace,2"
        "ALTSHIFT,3,movetoworkspace,3"
        "ALTSHIFT,4,movetoworkspace,4"
        "ALTSHIFT,5,movetoworkspace,5"
        "ALTSHIFT,6,movetoworkspace,6"
        "ALTSHIFT,7,movetoworkspace,7"
        "ALTSHIFT,8,movetoworkspace,8"
        "ALTSHIFT,9,movetoworkspace,9"
        "ALTSHIFT,0,movetoworkspace,10"

        # Resize window
        "ALTCTRL,left,resizeactive,-20 0"
        "ALTCTRL,right,resizeactive,20 0"
        "ALTCTRL,up,resizeactive,0 -20"
        "ALTCTRL,down,resizeactive,0 20"
        "ALTCTRL,H,resizeactive,-20 0"
        "ALTCTRL,L,resizeactive,20 0"
        "ALTCTRL,K,resizeactive,0 -20"
        "ALTCTRL,J,resizeactive,0 20"

        # Mouse
        "ALT,mouse_down,workspace,e+1"
        "ALT,mouse_up,workspace,e-1"
      ];

      bindm = [
        # Mouse
        "ALT,mouse:272,movewindow"
        "ALT,mouse:273,resizewindow"
      ];

      binde = [
        ",XF86MonBrightnessUp,exec,brightnessctl set 3%+ -q"
        ",XF86MonBrightnessDown,exec,brightnessctl set 3%-  -q"
        ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 3%+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-"
        ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioNext,exec,mpc next"
        ",XF86AudioPrev,exec,mpc prev"
        ",XF86AudioPlay,exec,mpc toggle"
        ",XF86AudioStop,exec,mpc stop"
      ];
    };
  };
}
