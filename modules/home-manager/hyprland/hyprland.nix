{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    settings = {

      monitor = ",preferred,auto,1";

      misc = {
        disable_hyprland_logo = true;
        vrr = 0;
      };

      input = {
        natural_scroll = "0";
        touchpad = { natural_scroll = "1"; };
        sensitivity = "0";
      };

      gestures = {
        workspace_swipe = "true";
        workspace_swipe_fingers = "3";
      };

      general = with config.colorScheme.palette; {
        layout = "master";
        # apply_sens_to_raw = "0";
        gaps_in = "4";
        gaps_out = "7";
        border_size = "3";
        "col.active_border" = "0xFF${base05}";
        "col.inactive_border" = "0xFF${base00}";
      };

      master = {
        new_status = "master";
        new_on_top = true;
      };

      decoration = {
        rounding = "4";
        active_opacity = "1.0";
        inactive_opacity = "1.0";
        fullscreen_opacity = "1.0";
        blur = { enabled = "false"; };
      };

      exec-once = [
        "waybar"
        # "${pkgs.swww}/bin/swww img ~/Pictures/Wallpapers/background.png --transition-type any"
        # "clash-verge"
      ];

      windowrulev2 = [
        # Telegram
        "float, class:(org.telegram.desktop), title:(Media viewer)"
        "center, class:(org.telegram.desktop), title:(Media viewer)"
        "size 70% 70%, class:(org.telegram.desktop), title:(Media viewer)"
        # Chrome
        "float, class:(google-chrome), title:(Open Files|Open File)"
        "center, class:(google-chrome), title:(Open Files|Open File)"
        "size 70% 70%, class:(google-chrome), title:(Open Files|Open File)"
        # Steam
        "float, class:(steam), title:(Friends List|Special Offers|Steam Settings|好友列表|特惠|Steam 设置)"
        "center, class:(steam), title:(关机|特惠)"
        "size 20% 80%, class:(steam), title:(好友列表)"
        # float-kitty
        "float, class:(float-kitty)"
        "center, class:(float-kitty)"
        "size 70% 70%, class:(float-kitty)"
        # Zotero
        "float, class:^(Zotero)$, title:^(Zotero Settings|Add-ons Manager|Plugins Manager|Add-on Market|Progress|Import|高级搜索|Advanced Search|Software Update)$"
        "center, class:^(Zotero)$, title:^(Zotero Settings|Add-ons Manager|Plugins Manager|Add-on Market|高级搜索|Advanced Search|Software Update)$"
        # QQ
        "float, class:(QQ), title:(设置|图片查看器|文件管理器|收藏|QQ机器人|腾讯频道|群相册|群作业 -.*|群精华)"
        "center, class:(QQ), title:(设置|图片查看器|文件管理器|收藏|QQ机器人|腾讯频道|群相册|群作业 -.*|群精华)"
        "float, class:(Qq), title:(Open Files)"
        "center, class:(Qq), title:(Open Files)"
        # WeChat
        "float, class:(wechat), title:(预览)"
        "center, class:(wechat), title:(预览)"
        # Godot
        "tile, class:^(Godot)$, title:^(Godot)$"
        # Godot Chinese
        "center, class:^(Godot)$, title:^(项目设置（project.godot）|编辑器设置)$"
        "size 50% 70%, class:^(Godot)$, title:^(项目设置（project.godot）|编辑器设置)$"
        # Godot English
        "center, class:^(Godot)$, title:^(Project Settings.*|Editor Settings|Open a File or Directory|Select a Folder to Scan|Quick Settings|Command Palette|Manage Editor Feature Profiles|Export Template Manager|Configure FBX Importer|Run Instances|Search Help|Thanks from the Godot community!|Export|Orphan Resource Explorer|Edit Compilation Configuration Profile|Create New Node)$"
        "size 50% 70%, class:^(Godot)$, title:^(Project Settings.*|Editor Settings|Open a File or Directory|Select a Folder to Scan|Command Palette|Search Help|Export|Orphan Resource Explorer|Edit Compilation Configuration Profile|Run Instances|Create New Node)$"
      ];

      "$term" = "kitty";
      "$launch" = "wofi --show drun --prompt 'Search...'";
      "$clipboard" = "cliphist list | wofi --dmenu | cliphist decode | wl-copy";
      # "$randomwallpaper" =
      # "${pkgs.swww}/bin/swww img $(find ~/Pictures/Wallpapers/. -name '*' | shuf -n1) --transition-type any";
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
        # "ALT,W,exec,$randomwallpaper"

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
        ",XF86MonBrightnessUp,exec,${pkgs.brightnessctl}/bin/brightnessctl set 3%+ -q"
        ",XF86MonBrightnessDown,exec,${pkgs.brightnessctl}/bin/brightnessctl set 3%-  -q"
        ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 3%+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-"
        ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioNext,exec,${pkgs.mpc-cli}/bin/mpc next"
        ",XF86AudioPrev,exec,${pkgs.mpc-cli}/bin/mpc prev"
        ",XF86AudioPlay,exec,${pkgs.mpc-cli}/bin/mpc toggle"
        ",XF86AudioStop,exec,${pkgs.mpc-cli}/bin/mpc stop"
      ];
    };
  };
}
