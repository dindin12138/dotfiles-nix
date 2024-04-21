{ pkgs, ... }:
{
  imports = [
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = ",preferred,auto,1";

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

      general = {
        layout = "master";
        apply_sens_to_raw = "0";
        gaps_in = "3";
        gaps_out = "5";
        border_size = "2";
        "col.active_border" = "0xFF6C7086";
        "col.inactive_border" = "0xFF343A40";
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
      ];

      "$term" = "kitty";
      "$menu" = "wofi --show drun --prompt 'Search...'";

      bind = [
        "ALT,Return,exec,$term"
        "ALT,D,exec,$menu"
        "ALTSHIFT,Q,killactive"
        "ALTSHIFT,x,exit"
        "ALT,left,movefocus,l"
        "ALT,right,movefocus,r"
        "ALT,up,movefocus,u"
        "ALT,down,movefocus,d"
        "ALT,H,movefocus,l"
        "ALT,L,movefocus,r"
        "ALT,K,movefocus,u"
        "ALT,J,movefocus,d"
        "ALTSHIFT,left,movewindow,l"
        "ALTSHIFT,right,movewindow,r"
        "ALTSHIFT,up,movewindow,u"
        "ALTSHIFT,down,movewindow,d"
        "ALTSHIFT,H,movewindow,l"
        "ALTSHIFT,L,movewindow,r"
        "ALTSHIFT,K,movewindow,u"
        "ALTSHIFT,J,movewindow,d"
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
      ];
    };
  };
}
