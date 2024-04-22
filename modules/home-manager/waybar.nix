{
  programs.waybar = {
    enable = true;
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
          on-click = "~/.config/hypr/scripts/w.sh";
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
          on-click = "~/.config/hypr/scripts/grimblast.sh --notify copysave area";
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
    style = "
            /* -----------------------------------------------------
            * Import Pywal colors 
            * ----------------------------------------------------- */

            @define-color backgroundlight #6c7086;
            /* @define-color backgrounddark #cdd6f4; */
            @define-color backgrounddark #FFFFFF;
            @define-color workspacesbackground1 #6c7086;
            /* @define-color workspacesbackground2 #cdd6f4; */
            @define-color workspacesbackground2 #FFFFFF;
            @define-color bordercolor #6c7086;
            @define-color textcolor1 #000000;
            @define-color textcolor2 #FFFFFF;
            @define-color textcolor3 #FFFFFF;
            @define-color iconcolor #FFFFFF;

            /* -----------------------------------------------------
            * General 
            * ----------------------------------------------------- */

            * {
                font-family: FiraCode Nerd Font;
                font-size: 16px;
                /* border: none; */
                /* border-radius: 0px; */
            }

            window#waybar {
                background-color: #1e1e2e;
                border-bottom: 0px solid #ffffff;
                /* color: #FFFFFF; */
                /* background: transparent; */
                transition-property: background-color;
                transition-duration: .5s;
            }

            /* -----------------------------------------------------
            * Tooltips
            * ----------------------------------------------------- */

            tooltip {
                border-radius: 10px;
                background-color: #1e1e2e;
                /* opacity:0.8; */
                padding:20px;
                margin:0px;
            }

            tooltip label {
                color: @textcolor2;
            }

            /* -----------------------------------------------------
            * Workspaces 
            * ----------------------------------------------------- */

            #workspaces {
                background: @workspacesbackground1;
                margin: 2px 1px 3px 1px;
                padding: 0px 1px;
                border-radius: 15px;
                border: 0px;
                font-weight: bold;
                font-style: normal;
                /* opacity: 0.8; */
                font-size: 16px;
                color: @textcolor1;
            }

            #workspaces button {
                padding: 0px 5px;
                margin: 4px 3px;
                border-radius: 15px;
                border: 0px;
                color: @textcolor1;
                background-color: @workspacesbackground2;
                transition: all 0.3s ease-in-out;
                opacity: 0.4;
            }

            #workspaces button.active {
                color: @textcolor1;
                background: @workspacesbackground2;
                border-radius: 15px;
                min-width: 40px;
                transition: all 0.3s ease-in-out;
                opacity:0.8;
            }

            #workspaces button:hover {
                color: @textcolor1;
                background: @workspacesbackground2;
                border-radius: 15px;
                opacity:0.7;
            }

            /* -----------------------------------------------------
            * Window
            * ----------------------------------------------------- */

            #window {
                background: @backgroundlight;
                margin: 5px 15px 5px 0px;
                padding: 2px 10px 0px 10px;
                border-radius: 12px;
                color:@textcolor2;
                font-size:16px;
                font-weight:normal;
                /* opacity:0.8; */
            }

            window#waybar.empty #window {
                background-color:transparent;
            }

            /* -----------------------------------------------------
            * Taskbar
            * ----------------------------------------------------- */

            #taskbar {
                background: #1e1e2e;
                margin: 3px 15px 3px 0px;
                padding:0px;
                border-radius: 8px;
                font-weight: normal;
                font-style: normal;
                /* opacity:0.8; */
                border: 2px solid @backgroundlight;
            }

            #taskbar button {
                margin: 0;
                border-radius: 8px;
                padding: 0px 5px 0px 5px;
            }

            #taskbar.empty {
                margin: 0;
                border: 0px;
            }

            /* -----------------------------------------------------
            * Modules
            * ----------------------------------------------------- */

            .modules-left > widget:first-child > #workspaces {
                margin-left: 0;
            }

            .modules-right > widget:last-child > #workspaces {
                margin-right: 0;
            }

            /* -----------------------------------------------------
            * Custom Quicklinks
            * ----------------------------------------------------- */

            #custom-brave, 
            #custom-browser, 
            #custom-keybindings, 
            #custom-outlook, 
            #custom-filemanager, 
            #custom-teams, 
            #custom-chatgpt, 
            #custom-calculator, 
            #custom-windowsvm, 
            #custom-cliphist, 
            #custom-wallpaper, 
            #custom-settings, 
            #custom-wallpaper, 
            #custom-system,
            #custom-colorpicker,
            #custom-screenshot,
            #custom-waybarthemes {
                margin-right: 23px;
                font-size: 20px;
                font-weight: bold;
                /* opacity: 0.8; */
                color: @iconcolor;
            }

            #custom-system {
                margin-right:15px;
            }

            #custom-wallpaper {
                margin-right:25px;
            }

            #custom-waybarthemes, #custom-settings, #custom-colorpicker, #custom-screenshot {
                margin-right:20px;
            }

            /* -----------------------------------------------------
            * Idle Inhibator
            * ----------------------------------------------------- */

            /* #idle_inhibitor {
                margin-right: 15px;
                font-size: 22px;
                font-weight: bold;
                opacity: 0.8;
                color: @iconcolor;
            }

            #idle_inhibitor.activated {
                margin-right: 15px;
                font-size: 20px;
                font-weight: bold;
                opacity: 0.8;
                color: #dc2f2f;
            } */

            #idle_inhibitor {
                margin: 0px 20px 0px 0px;
                padding:0px;
                font-size:20px;
                color: @iconcolor;
            }

            #idle_inhibitor.activated {
                margin: 0px 20px 0px 0px;
                padding:0px;
                font-size:20px;
                /* color: @iconcolor; */
                color: #dc2f2f;
            }

            /* -----------------------------------------------------
            * Custom Modules
            * ----------------------------------------------------- */

            #custom-appmenu, #custom-appmenuwlr {
                background-color: @backgrounddark;
                font-size: 16px;
                color: @textcolor1;
                border-radius: 15px;
                padding: 0px 10px 0px 10px;
                margin: 3px 15px 3px 5px;
                opacity:0.8;
                border:3px solid @bordercolor;
            }

            /* -----------------------------------------------------
            * Custom Exit
            * ----------------------------------------------------- */

            #custom-exit, #custom-reboot, #custom-logout  {
                margin: 0px 20px 0px 0px;
                padding:0px;
                font-size:20px;
                color: @iconcolor;
            }

            /* -----------------------------------------------------
            * Custom Updates
            * ----------------------------------------------------- */

            #custom-updates {
                background-color: @backgroundlight;
                font-size: 16px;
                color: @textcolor2;
                border-radius: 15px;
                padding: 2px 10px 0px 10px;
                margin: 5px 15px 5px 0px;
                opacity:0.8;
            }

            #custom-updates.green {
                background-color: @backgroundlight;
            }

            #custom-updates.yellow {
                background-color: #ff9a3c;
                color: #FFFFFF;
            }

            #custom-updates.red {
                background-color: #dc2f2f;
                color: #FFFFFF;
            }

            /* -----------------------------------------------------
            * Custom Youtube
            * ----------------------------------------------------- */

            #custom-youtube {
                background-color: @backgroundlight;
                font-size: 16px;
                color: @textcolor2;
                border-radius: 15px;
                padding: 2px 10px 0px 10px;
                margin: 5px 15px 5px 0px;
                opacity:0.8;
            }

            /* -----------------------------------------------------
            * Hardware Group
            * ----------------------------------------------------- */

            #disk,#memory,#cpu,#language {
                margin:0px;
                padding:0px;
                font-size:16px;
                color:@iconcolor;
            }

            #language {
                margin-right:10px;
            }

            /* -----------------------------------------------------
            * Clock
            * ----------------------------------------------------- */

            #clock {
                background-color: @backgrounddark;
                font-size: 16px;
                color: @textcolor1;
                border-radius: 15px;
                padding: 1px 10px 0px 10px;
                margin: 3px 5px 3px 0px;
                opacity:0.8;
                border:3px solid @bordercolor;   
            }

            /* -----------------------------------------------------
            * Pulseaudio
            * ----------------------------------------------------- */

            #pulseaudio {
                background-color: @backgroundlight;
                font-size: 16px;
                color: @textcolor2;
                border-radius: 15px;
                padding: 2px 10px 0px 10px;
                margin: 5px 15px 5px 0px;
                /* opacity:0.8; */
            }

            #pulseaudio.muted {
                background-color: @backgrounddark;
                color: @textcolor1;
            }

            /* -----------------------------------------------------
            * backlight
            * ----------------------------------------------------- */

            #backlight {
                background-color: @backgroundlight;
                font-size: 16px;
                color: @textcolor2;
                border-radius: 15px;
                padding: 2px 10px 0px 10px;
                margin: 5px 15px 5px 0px;
                /* opacity:0.8; */
            }

            /* -----------------------------------------------------
            * MPD
            * ----------------------------------------------------- */

            #mpd {
                background-color: @backgroundlight;
                font-size: 16px;
                color: @textcolor2;
                border-radius: 15px;
                padding: 2px 10px 0px 10px;
                margin: 5px 15px 5px 15px;
                /* opacity:0.8; */
            }

            /* -----------------------------------------------------
            * Network
            * ----------------------------------------------------- */

            #network {
                background-color: @backgroundlight;
                font-size: 16px;
                color: @textcolor2;
                border-radius: 15px;
                padding: 2px 10px 0px 10px;
                margin: 5px 15px 5px 0px;
                /* opacity:0.8; */
            }

            #network.ethernet {
                background-color: @backgroundlight;
                color: @textcolor2;
            }

            #network.wifi {
                background-color: @backgroundlight;
                color: @textcolor2;
            }

            /* -----------------------------------------------------
            * Bluetooth
            * ----------------------------------------------------- */

            #bluetooth, #bluetooth.on, #bluetooth.connected {
                background-color: @backgroundlight;
                font-size: 16px;
                color: @textcolor2;
                border-radius: 15px;
                padding: 2px 10px 0px 10px;
                margin: 5px 15px 5px 0px;
                opacity:0.8;
            }

            #bluetooth.off {
                background-color: transparent;
                padding: 0px;
                margin: 0px;
            }

            /* -----------------------------------------------------
            * Battery
            * ----------------------------------------------------- */

            #battery {
                background-color: @backgroundlight;
                font-size: 16px;
                color: @textcolor2;
                border-radius: 15px;
                padding: 2px 15px 0px 10px;
                margin: 5px 15px 5px 0px;
                opacity:0.8;
            }

            #battery.charging, #battery.plugged {
                color: @textcolor2;
                background-color: @backgroundlight;
            }

            @keyframes blink {
                to {
                    background-color: @backgroundlight;
                    color: @textcolor2;
                }
            }

            #battery.critical:not(.charging) {
                background-color: #f53c3c;
                color: @textcolor3;
                animation-name: blink;
                animation-duration: 0.5s;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }

            /* -----------------------------------------------------
            * Tray
            * ----------------------------------------------------- */

            #tray {
                padding: 0px 15px 0px 0px;
            }

            #tray > .passive {
                -gtk-icon-effect: dim;
            }

            #tray > .needs-attention {
                -gtk-icon-effect: highlight;
            }
        ";
  };
}
