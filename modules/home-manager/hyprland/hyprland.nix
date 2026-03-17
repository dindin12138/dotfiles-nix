{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    settings = {
      monitor = "eDP-1,2880x1800@90,auto,1.5";

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

      general = {
        layout = "scrolling";
        gaps_in = "4";
        gaps_out = "7";
        border_size = "3";
        "col.active_border" = "0xFF${config.lib.stylix.colors.base0D}";
        "col.inactive_border" = "0xFF${config.lib.stylix.colors.base00}";
      };

      master = {
        new_status = "master";
        new_on_top = true;
      };

      scrolling = {
        explicit_column_widths = "0.45,0.55,1.0";
        fullscreen_on_one_column = false;
        column_width = 1;
        focus_fit_method = 1;
      };

      decoration = {
        rounding = "20";
        blur = {
          enabled = "true";
          size = 3;
          passes = 2;
          vibrancy = 0.1696;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      layerrule = {
        name = "noctalia";
        "match:namespace" = "noctalia-background-.*$";
        ignore_alpha = 0.5;
        blur = true;
        blur_popups = true;
      };

      animations = {
        bezier = [
          "fluent, 0.25, 1, 0.5, 1"
          "niri_slide, 0.25, 1.0, 0.1, 1.0"
        ];
        animation = [
          "windowsMove, 1, 8, niri_slide"
          "workspaces, 1, 8, niri_slide, slidevert"
          "windowsIn, 1, 8, niri_slide, popin 85%"
          "windowsOut, 1, 8, niri_slide, popin 85%"
          "border, 1, 5, default"
          "fade, 1, 4, fluent"
        ];
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      env = [
        # grimblast
        "DEFAULT_TARGET_DIR,${config.home.homeDirectory}/InfiniCloud/Picture/Screenshots"
        "DATE_FORMAT,%Y%m%d-%H%M%S"
      ];

      exec-once = [
        "noctalia-shell"
        "clash-verge"
      ];

      windowrule = [
        "float on, center on, size (monitor_w*0.7) (monitor_h*0.7), match:class (org.telegram.desktop), match:title (Media viewer)"
        "float on, center on, size (monitor_w*0.7) (monitor_h*0.7), match:class (google-chrome), match:title (Open Files|Open File)"
        "float on, match:class (steam), match:title (Friends List|Special Offers|Steam Settings|好友列表|特惠|Steam 设置)"
        "center on, match:class (steam), match:title (关机|特惠)"
        "size (monitor_w*0.2) (monitor_h*0.8), match:class (steam), match:title (好友列表)"
        "float on, center on, size (monitor_w*0.7) (monitor_h*0.7), match:class (float-kitty)"
        "float on, match:class ^(Zotero)$, match:title ^(Zotero Settings|Add-ons Manager|Plugins Manager|Add-on Market|Progress|Import|高级搜索|Advanced Search|Software Update)$"
        "center on, match:class ^(Zotero)$, match:title ^(Zotero Settings|Add-ons Manager|Plugins Manager|Add-on Market|高级搜索|Advanced Search|Software Update)$"
        "float on, center on, match:class (QQ), match:title (设置|图片查看器|文件管理器|收藏|QQ机器人|腾讯频道|群相册|群作业 -.*|群精华)"
        "float on, center on, match:class (Qq), match:title (Open Files)"
        "float on, center on, match:class (wechat), match:title (预览)"
        "tile on, match:class ^(Godot)$, match:title ^(Godot)$"
        "center on, size (monitor_w*0.5) (monitor_h*0.7), match:class ^(Godot)$, match:title ^(项目设置（project.godot）|编辑器设置)$"
        "center on, match:class ^(Godot)$, match:title ^(Project Settings.*|Editor Settings|Open a File or Directory|Select a Folder to Scan|Quick Settings|Command Palette|Manage Editor Feature Profiles|Export Template Manager|Configure FBX Importer|Run Instances|Search Help|Thanks from the Godot community!|Export|Orphan Resource Explorer|Edit Compilation Configuration Profile|Create New Node)$"
        "size (monitor_w*0.5) (monitor_h*0.7), match:class ^(Godot)$, match:title ^(Project Settings.*|Editor Settings|Open a File or Directory|Select a Folder to Scan|Command Palette|Search Help|Export|Orphan Resource Explorer|Edit Compilation Configuration Profile|Run Instances|Create New Node)$"
      ];

      bind = [
        # APPs
        "ALT,Return,exec,foot"
        "ALT,D,exec,vicinae toggle"
        "ALT,E,exec,nautilus"
        "ALT,C,exec,vicinae vicinae://extensions/vicinae/clipboard/history"
        "ALT,M,exec,ghostty -e rmpc"
        "SUPER,L,exec,noctalia-shell ipc call lockScreen lock"
        "ALT,S,exec,${pkgs.grimblast}/bin/grimblast --notify copysave area"

        # Hyprland
        "ALTSHIFT,Q,killactive"
        "ALTSHIFT,X,exit"
        "ALTSHIFT,F,fullscreen"
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
        "ALTSHIFT,left,layoutmsg,swapcol l"
        "ALTSHIFT,right,layoutmsg,swapcol r"
        "ALTSHIFT,H,layoutmsg,swapcol l"
        "ALTSHIFT,L,layoutmsg,swapcol r"
        "ALTSHIFT,up,movewindow,u"
        "ALTSHIFT,down,movewindow,d"
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
        # "ALTCTRL,left,resizeactive,-20 0"
        # "ALTCTRL,right,resizeactive,20 0"
        # "ALTCTRL,up,resizeactive,0 -20"
        # "ALTCTRL,down,resizeactive,0 20"
        # "ALTCTRL,H,resizeactive,-20 0"
        # "ALTCTRL,L,resizeactive,20 0"
        # "ALTCTRL,K,resizeactive,0 -20"
        # "ALTCTRL,J,resizeactive,0 20"
        "ALT,R,layoutmsg,colresize +conf"
        "ALT,F,layoutmsg,colresize 1.0"
        "ALT,minus,layoutmsg,colresize -0.1"
        "ALT,equal,layoutmsg,colresize +0.1"
        "ALTSHIFT,minus,resizeactive,0 -100"
        "ALTSHIFT,equal,resizeactive,0 100"

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
        ",XF86MonBrightnessUp,exec,noctalia-shell ipc call brightness increase"
        ",XF86MonBrightnessDown,exec,noctalia-shell ipc call brightness decrease"
        ",XF86AudioRaiseVolume,exec,noctalia-shell ipc call volume increase"
        ",XF86AudioLowerVolume,exec,noctalia-shell ipc call volume decrease"
        ",XF86AudioMute,exec,noctalia-shell ipc call volume muteOutput"
        ",XF86AudioMicMute,exec,noctalia-shell ipc call volume muteInput"
        ",XF86AudioNext,exec,noctalia-shell ipc call media next"
        ",XF86AudioPrev,exec,noctalia-shell ipc call media previous"
        ",XF86AudioPlay,exec,noctalia-shell ipc call media play"
        ",XF86AudioStop,exec,noctalia-shell ipc call media pause"
      ];
    };
  };
}
