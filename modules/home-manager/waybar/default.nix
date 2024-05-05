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
          "wlr/taskbar"
          "hyprland/window"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          # "mpd"
          # "custom/updates"
          "pulseaudio"
          "backlight"
          # "battery"
          "network"
          "group/hardware"
          "tray"
          # "idle_inhibitor"
          "group/power"
          "clock"
        ];

        # modules
        "custom/appmenu" = {
          format = "Apps";
          on-click = "wofi";
          # on-click-right =  "~/dotfiles/hypr/scripts/keybindings.sh";
          tooltip = false;
        };

        "custom/wallpaper" = {
          format = "";
          on-click = "${pkgs.swww}/bin/swww img $(find ~/Pictures/Wallpapers/. -name '*.png' | shuf -n1) --transition-type any";
          # on-click-right =  "~/dotfiles/hypr/scripts/wallpaper.sh"
          tooltip = false;
        };

        "custom/colorpicker" = {
          format = "󰸱";
          on-click = "hyprpicker";
          tooltip = false;
        };

        "custom/screenshot" = {
          format = "󰩬";
          on-click = "grimblast --notify copysave area";
          tooltip = false;
        };

        "wlr/taskbar" = {
          all-outputs = false;
          format = "{icon}";
          icon-size = 20;
          tooltip = false;
          # tooltip-format =  "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [ "wofi" "rofi" ];
          app_ids-mapping = {
            firefoxdeveloperedition = "firefox-developer-edition";
          };
          rewrite = {
            "Firefox Web Browser" = "Firefox";
            "Foot Server" = "Terminal";
          };
        };

        "hyprland/window" = {
          rewrite = {
            "(.*) - Brave" = "$1";
            "(.*) - Chromium" = "$1";
            "(.*) - Brave Search" = "$1";
            "(.*) - Outlook" = "$1";
            "(.*) Microsoft Teams" = "$1";
          };
          "separate-outputs" = true;
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
          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
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
          on-scroll-up = "light -A 5%";
          on-scroll-down = "light -U 5%";
          smooth-scrolling-threshold = 1;
        };

        "network" = {
          format = "{ifname}";
          format-wifi = "󰖩 {essid}";
          format-ethernet = "󰈀 {ipaddr}/{cidr}";
          format-disconnected = "󰖪 Disconnected";
          format-disabled = "󰖪 Disabled";
          format-alt = " {bandwidthDownBytes} |  {bandwidthUpBytes}";
          tooltip-format = "󰖩 {ifname} via {gwaddr}";
          tooltip-format-wifi = "󰖩 {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
          tooltip-format-ethernet = "󰈀 {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
          tooltip-format-disconnected = "󰖪 Disconnected";
          max-length = 50;
          on-click-right = "nm-connection-editor";
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
          icon-size = 20;
          spacing = 10;
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
