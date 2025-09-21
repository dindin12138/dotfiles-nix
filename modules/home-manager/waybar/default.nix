{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = "${builtins.readFile ./style.css}";
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
          "mpd"
          "hyprland/window"
          # "niri/window"
        ];
        modules-center = [
          "hyprland/workspaces"
          # "niri/workspaces"
        ];
        modules-right = [
          # "custom/updates"
          "bluetooth"
          "pulseaudio"
          "backlight"
          "battery"
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
          # on-click =
          # "${pkgs.swww}/bin/swww img $(find ~/Pictures/Wallpapers/. -name '*.png' | shuf -n1) --transition-type any";
          # on-click-right =
          # "${pkgs.swww}/bin/swww img ~/Pictures/Wallpapers/background.png --transition-type any";
          tooltip = false;
        };

        "custom/colorpicker" = {
          format = "󰸱";
          on-click = "${pkgs.hyprpicker}/bin/hyprpicker --format=hex --autocopy";
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
          icon-size = 20; # 1080p
          # icon-size = 30; # 2k
          rewrite = {
            "(.*)Mozilla Firefox" = "Mozilla Firefox";
            "(.*)Google Chrome" = "Google Chrome";
            "(.*)Visual Studio Code" = "Visual Studio Code";
            "(.*)Zotero" = "Zotero";
            "(.*)Obsidian(.*)" = "Obsidian";
            "(.*)Typora" = "Typora";
            "(.*)qutebrowser" = "Qutebrowser";
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

        "niri/window" = {
          format = "{}";
          icon = true;
          icon-size = 20;
          rewrite = {
            "(.*)Mozilla Firefox" = "Mozilla Firefox";
            "(.*)Google Chrome" = "Google Chrome";
            "(.*)Visual Studio Code" = "Visual Studio Code";
            "(.*)Zotero" = "Zotero";
            "(.*)Obsidian(.*)" = "Obsidian";
            "(.*)Typora" = "Typora";
            "(.*)qutebrowser" = "Qutebrowser";
          };
        };

        "niri/workspaces" = {
          all-outputs = false;
          format = "{}";
          disable-click = false;
          current-only = false;
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
          on-click-right = "kitty -e rmpc";
          on-update = "";
          on-scroll-up = "${pkgs.mpc-cli}/bin/mpc prev";
          on-scroll-down = "${pkgs.mpc-cli}/bin/mpc next";
          smooth-scrolling-threshold = 1;
          max-length = 40;
        };

        "bluetooth" = {
          format = " {status}";
          format-disabled = " Disabled";
          format-off = " Off";
          format-on = " On";
          format-connected-battery = " {device_battery_percentage}%";
          interval = 30;
          on-click = "${pkgs.blueman}/bin/blueman-manager";
          tooltip-format = ''
            {controller_alias}	{controller_address}

            {num_connections} connected'';
          tooltip-format-connected = ''
            {controller_alias}	{controller_address}

            {num_connections} connected

            {device_enumerate}'';
          tooltip-format-enumerate-connected = "{device_alias}	{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}	{device_address}	{device_battery_percentage}%";
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
            default = [
              ""
              " "
              " "
            ];
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
          format-icons = [
            "󱩏"
            "󱩑"
            "󱩔"
            "󱩖"
          ];
          on-click = "";
          on-click-middle = "";
          on-click-right = "";
          on-update = "";
          on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set 3%+ -q";
          on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set 3%-  -q";
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
          tooltip-format-wifi = ''
            󰖩 {ifname} @ {essid}
            IP: {ipaddr}
            Strength: {signalStrength}%
            Freq: {frequency}MHz
            Up: {bandwidthUpBytes} Down: {bandwidthDownBytes}'';
          tooltip-format-ethernet = ''
            󰈀 {ifname}
            IP: {ipaddr}
             up: {bandwidthUpBits} down: {bandwidthDownBits}'';
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
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
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
          modules = [
            "memory"
            "disk"
            "cpu"
          ];
        };

        "tray" = {
          icon-size = 20;
          spacing = 15;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          tooltip = true;
          format-icons = {
            activated = "";
            deactivated = "";
          };
          on-click-right = "${pkgs.hyprlock}/bin/hyprlock";
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
          modules = [
            "custom/exit"
            "custom/reboot"
            "custom/logout"
          ];
        };

        "clock" = {
          # timezone = "America/New_York";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = "{:%Y-%m-%d}";
        };
      };
    };
  };
}
