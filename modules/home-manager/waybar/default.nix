{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = ''${builtins.readFile ./style.css}'';
    settings = {
      mainBar = {
        layer = "top";
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 0;
        modules-left = [
          "custom/appmenu"
          "custom/wallpaper"
          "custom/colorpicker"
          "custom/screenshot"
          # "wlr/taskbar"
          "hyprland/window"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "mpd"
          # "custom/updates"
          "pulseaudio"
          # "backlight"
          # "battery"
          "group/hardware"
          "tray"
          "network"
          "idle_inhibitor"
          "group/power"
          "clock"
        ];

        # modules
        "custom/appmenu" = {
          format = "Apps";
          on-click = "wofi";
          tooltip = false;
        };

        "custom/wallpaper" = {
          format = "";
          on-click = "${pkgs.swww}/bin/swww img $(find ~/Pictures/Wallpapers/. -name '*.png' | shuf -n1) --transition-type any";
          on-click-right = "${pkgs.swww}/bin/swww img ~/Pictures/Wallpapers/background.png --transition-type any";
          tooltip = false;
        };

        "custom/colorpicker" = {
          format = "󰸱";
          on-click = "hyprpicker --format=hex --autocopy";
          tooltip = false;
        };

        "custom/screenshot" = {
          format = "󰩬";
          on-click = "grimblast --notify copysave area";
          on-click-right = "grimblast --notify copysave screen";
          tooltip = false;
        };

        # "wlr/taskbar" = {
        #   all-outputs = false;
        #   format = "{icon}";
        #   icon-size = 20;
        #   tooltip = false;
        #   # tooltip-format =  "{title}";
        #   on-click = "activate";
        #   on-click-middle = "close";
        #   ignore-list = [ "wofi" "rofi" ];
        #   app_ids-mapping = {
        #     firefoxdeveloperedition = "firefox-developer-edition";
        #   };
        #   rewrite = {
        #     "Firefox Web Browser" = "Firefox";
        #     "Foot Server" = "Terminal";
        #   };
        # };

        "hyprland/window" = {
          format = "{}";
          icon = true;
          # icon-size = 20; # 1080p
          icon-size = 30; # 2k
          rewrite = {
            "(.*)Mozilla Firefox" = "Mozilla Firefox";
            "(.*)Google Chrome" = "Google Chrome";
            "(.*)Visual Studio Code" = "Visual Studio Code";
            "(.*)Zotero" = "Zotero";
            "(.*)Obsidian(.*)" = "Obsidian";
            "(.*)Typora" = "Typora";
          };
        };

        "hyprland/workspaces" = {
          on-click = "activate";
          active-only = false;
          all-outputs = true;
          format = "{}";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "mpd" = {
          interval = 2;
          unknown-tag = "N/A";
          format = "{stateIcon} {title}";
          format-disconnected = "󱘖 Disconnected";
          format-paused = "{stateIcon} {title}";
          format-stopped = " Stopped";
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "{artist} - {title}";
          tooltip-format-disconnected = "MPD (disconnected)";
          on-click = "${pkgs.mpc-cli}/bin/mpc toggle";
          # "on-click-middle": "mpc prev";
          on-click-right = "kitty -e ncmpcpp";
          on-update = "";
          on-scroll-up = "${pkgs.mpc-cli}/bin/mpc prev";
          on-scroll-down = "${pkgs.mpc-cli}/bin/mpc next";
          smooth-scrolling-threshold = 1;
          max-length = 40;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " Mute";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "󰏶";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = [ "" " " " " ];
          };
          scroll-step = 5.0;
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "${pkgs.pavucontrol}/bin/pavucontrol";
          smooth-scrolling-threshold = 1;
        };

        "backlight" = {
          interval = 2;
          align = 0;
          rotate = 0;
          format = "{icon} {percent}%";
          format-icons = [ "󱩏" "󱩑" "󱩔" "󱩖" ];
          on-click = "";
          on-click-middle = "";
          on-click-right = "";
          on-update = "";
          on-scroll-up = "brightnessctl set 3%+ -q";
          on-scroll-down = "brightnessctl set 3%-  -q";
          smooth-scrolling-threshold = 1;
        };

        "network" = {
          format = "{ifname}";
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          format-disconnected = "󰖪";
          format-disabled = "󰖪";
          # format-wifi = "󰖩 {essid}";
          # format-ethernet = "󰈀 {ipaddr}/{cidr}";
          # format-disconnected = "󰖪 Disconnected";
          # format-disabled = "󰖪 Disabled";
          # format-alt = " {bandwidthDownBytes} |  {bandwidthUpBytes}";
          tooltip-format = "󰖩 {ifname} via {gwaddr}";
          tooltip-format-wifi = "󰖩 {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBytes} Down: {bandwidthDownBytes}";
          tooltip-format-ethernet = "󰈀 {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
          tooltip-format-disconnected = "󰖪 Disconnected";
          max-length = 50;
          # on-click-right = "nm-connection-editor";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}{capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [ " " " " " " " " " " ];
        };

        "cpu" = {
          format = " {usage}% ";
          on-click = "kitty -e btop";
        };

        "memory" = {
          format = "󰄪 {}% ";
          on-click = "kitty -e btop";
        };

        "disk" = {
          interval = 30;
          format = " {percentage_used}% ";
          path = "/";
          on-click = "kitty -e btop";
        };

        "group/hardware" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "not-memory";
            transition-left-to-right = false;
          };
          modules = [ "memory" "disk" "cpu" ];
        };

        "tray" = {
          # icon-size = 20; # 1080p
          # spacing = 10;
          icon-size = 30; # 2k
          spacing = 15;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          tooltip = true;
          format-icons = {
            activated = "";
            deactivated = "";
          };
          on-click-right = "hyprlock";
        };

        "custom/exit" = {
          format = "";
          on-click = "shutdown -h now";
          tooltip = false;
        };
        "custom/reboot" = {
          format = "";
          on-click = "reboot";
          tooltip = false;
        };
        "custom/logout" = {
          format = "";
          on-click = "exit";
          tooltip = false;
        };

        "group/power" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "not-memory";
            transition-left-to-right = false;
          };
          modules = [ "custom/exit" "custom/reboot" "custom/logout" ];
        };

        "clock" = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
      };
    };
  };
}
