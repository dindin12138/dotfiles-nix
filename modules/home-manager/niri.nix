{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      # --- Input ---
      input = {
        keyboard = {
          numlock = true;
        };

        touchpad = {
          tap = true;
          natural-scroll = true;
        };
      };

      # --- Outputs ---
      outputs = {
        "eDP-1" = {
          mode = {
            width = 2880;
            height = 1800;
            refresh = 90.000;
          };
          scale = 1.5;
          transform.rotation = 0; # normal
          position = {
            x = 1280;
            y = 0;
          };
        };
      };

      # --- Layout ---
      layout = {
        gaps = 10;
        center-focused-column = "on-overflow";

        preset-column-widths = [
          { proportion = 0.45; }
          { proportion = 0.55; }
        ];

        default-column-width = {
          proportion = 1.0;
        };

        focus-ring = {
          enable = true;
          width = 3;
          active = {
            color = "#${config.lib.stylix.colors.base0D}";
          };
          inactive = {
            color = "#${config.lib.stylix.colors.base00}";
          };
        };

        border.enable = false;
        shadow.enable = false;
      };

      # --- Spawn at Startup ---
      spawn-at-startup = [
        { argv = [ "noctalia-shell" ]; }
        { argv = [ "clash-verge" ]; }
      ];

      # --- Misc Settings ---
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
      screenshot-path = "${config.home.homeDirectory}/Pictures/Screenshots/%Y%m%d-%H%M%S.png";

      # --- Animations ---
      animations = {
        enable = true;
        slowdown = 2.0;
      };

      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite;
      };

      # --- Window Rules ---
      window-rules = [
        # WezTerm workaround
        {
          matches = [ { app-id = "^org\\.wezfurlong\\.wezterm$"; } ];
          default-column-width = { };
        }
        # Firefox Picture-in-Picture
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
        }
        # Float Term
        {
          matches = [ { app-id = "float-term"; } ];
          open-floating = true;
          default-column-width = {
            proportion = 0.75;
          };
          default-window-height = {
            proportion = 0.75;
          };
        }
        # Zotero Dialogs
        {
          matches = [
            {
              app-id = "Zotero";
              title = "(Zotero Settings|Progress|Add-ons Manager|Plugins Manager|Add-on Market|User Information|Zotero Report)";
            }
          ];
          open-floating = true;
        }
        # Zotero Creation Dialogs
        {
          matches = [
            {
              app-id = "Zotero";
              title = "(Create Parent Item|New Collection)";
            }
          ];
          open-floating = true;
          default-column-width = {
            proportion = 0.29;
          };
          default-window-height = {
            proportion = 0.19;
          };
        }
        # Chrome Open Files
        {
          matches = [
            {
              app-id = "google-chrome";
              title = "Open Files";
            }
          ];
          open-floating = true;
          default-column-width = {
            proportion = 0.75;
          };
          default-window-height = {
            proportion = 0.75;
          };
        }
        # Rounded corners (commented out in original)
        {
          geometry-corner-radius = {
            top-left = 12.0;
            top-right = 12.0;
            bottom-left = 12.0;
            bottom-right = 12.0;
          };
          clip-to-geometry = true;
        }
      ];

      # --- Layer Rules ---
      layer-rules = [
        {
          # matches = [ { namespace = "dms:blurwallpaper"; } ];
          matches = [ { namespace = "^noctalia-overview*"; } ];
          place-within-backdrop = true;
        }
      ];

      # --- Key Bindings ---
      binds = {
        "Alt+Shift+Slash".action.show-hotkey-overlay = [ ];

        # Running programs
        "Alt+T".action.spawn = [ "foot" ];
        "Alt+Return".action.spawn = [ "foot" ];
        "Alt+D".action.spawn = [
          "vicinae"
          "toggle"
        ];
        "Alt+E".action.spawn = [ "nautilus" ];

        # "Super+Alt+L".action.spawn = [
        #   "dms"
        #   "ipc"
        #   "call"
        #   "lock"
        #   "lock"
        # ];
        "Super+Alt+L".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "lockScreen"
          "lock"
        ];
        "Alt+C".action.spawn = [
          "vicinae"
          "vicinae://extensions/vicinae/clipboard/history"
        ];
        # "Alt+Shift+X".action.spawn = [
        #   "dms"
        #   "ipc"
        #   "call"
        #   "powermenu"
        #   "toggle"
        # ];
        # "Mod+C".action.spawn = [
        #   "dms"
        #   "ipc"
        #   "call"
        #   "control-center"
        #   "toggle"
        # ];
        "Mod+C".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "controlCenter"
          "toggle"
        ];

        # Audio
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          # action.spawn = [
          #   "dms"
          #   "ipc"
          #   "call"
          #   "audio"
          #   "increment"
          #   "3"
          # ];
          action.spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "volume"
            "increase"
          ];
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          # action.spawn = [
          #   "dms"
          #   "ipc"
          #   "call"
          #   "audio"
          #   "decrement"
          #   "3"
          # ];
          action.spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "volume"
            "decrease"
          ];
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          # action.spawn = [
          #   "dms"
          #   "ipc"
          #   "call"
          #   "audio"
          #   "mute"
          # ];
          action.spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "volume"
            "muteOutput"
          ];
        };
        "XF86AudioMicMute" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "volume"
            "muteInput"
          ];
        };

        # Brightness
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          # action.spawn = [
          #   "dms"
          #   "ipc"
          #   "call"
          #   "brightness"
          #   "increment"
          #   "5"
          #   ""
          # ];
          action.spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "brightness"
            "increase"
          ];
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          # action.spawn = [
          #   "dms"
          #   "ipc"
          #   "call"
          #   "brightness"
          #   "decrement"
          #   "5"
          #   ""
          # ];
          action.spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "brightness"
            "decrease"
          ];
        };

        # Overview
        "Alt+O" = {
          repeat = false;
          action.toggle-overview = [ ];
        };

        # Window management
        "Alt+Shift+Q" = {
          repeat = false;
          action.close-window = [ ];
        };

        "Alt+Left".action.focus-column-left = [ ];
        "Alt+Down".action.focus-window-down = [ ];
        "Alt+Up".action.focus-window-up = [ ];
        "Alt+Right".action.focus-column-right = [ ];
        "Alt+H".action.focus-column-left = [ ];
        "Alt+J".action.focus-window-down = [ ];
        "Alt+K".action.focus-window-up = [ ];
        "Alt+L".action.focus-column-right = [ ];

        "Alt+Shift+Left".action.move-column-left = [ ];
        "Alt+Shift+Down".action.move-window-down = [ ];
        "Alt+Shift+Up".action.move-window-up = [ ];
        "Alt+Shift+Right".action.move-column-right = [ ];
        "Alt+Shift+H".action.move-column-left = [ ];
        "Alt+Shift+J".action.move-window-down = [ ];
        "Alt+Shift+K".action.move-window-up = [ ];
        "Alt+Shift+L".action.move-column-right = [ ];

        "Alt+Home".action.focus-column-first = [ ];
        "Alt+End".action.focus-column-last = [ ];
        "Alt+Ctrl+Home".action.move-column-to-first = [ ];
        "Alt+Ctrl+End".action.move-column-to-last = [ ];

        # Monitor Focus
        "Mod+Left".action.focus-monitor-left = [ ];
        "Mod+Down".action.focus-monitor-down = [ ];
        "Mod+Up".action.focus-monitor-up = [ ];
        "Mod+Right".action.focus-monitor-right = [ ];
        "Mod+H".action.focus-monitor-left = [ ];
        "Mod+J".action.focus-monitor-down = [ ];
        "Mod+K".action.focus-monitor-up = [ ];
        "Mod+L".action.focus-monitor-right = [ ];

        # Monitor Move
        "Mod+Shift+Left".action.move-column-to-monitor-left = [ ];
        "Mod+Shift+Down".action.move-column-to-monitor-down = [ ];
        "Mod+Shift+Up".action.move-column-to-monitor-up = [ ];
        "Mod+Shift+Right".action.move-column-to-monitor-right = [ ];
        "Mod+Shift+H".action.move-column-to-monitor-left = [ ];
        "Mod+Shift+J".action.move-column-to-monitor-down = [ ];
        "Mod+Shift+K".action.move-column-to-monitor-up = [ ];
        "Mod+Shift+L".action.move-column-to-monitor-right = [ ];

        # Workspace Navigation
        "Alt+Page_Down".action.focus-workspace-down = [ ];
        "Alt+Page_Up".action.focus-workspace-up = [ ];
        "Alt+Ctrl+Page_Down".action.move-column-to-workspace-down = [ ];
        "Alt+Ctrl+Page_Up".action.move-column-to-workspace-up = [ ];

        "Alt+Shift+Page_Down".action.move-workspace-down = [ ];
        "Alt+Shift+Page_Up".action.move-workspace-up = [ ];
        "Alt+Shift+U".action.move-workspace-down = [ ];
        "Alt+Shift+I".action.move-workspace-up = [ ];
        "Alt+Ctrl+U".action.move-column-to-workspace-down = [ ];
        "Alt+Ctrl+I".action.move-column-to-workspace-up = [ ];

        # Mouse Wheel Binds (with cooldown)
        "Alt+WheelScrollDown" = {
          cooldown-ms = 150;
          action.focus-workspace-down = [ ];
        };
        "Alt+WheelScrollUp" = {
          cooldown-ms = 150;
          action.focus-workspace-up = [ ];
        };
        "Alt+Ctrl+WheelScrollDown" = {
          cooldown-ms = 150;
          action.move-column-to-workspace-down = [ ];
        };
        "Alt+Ctrl+WheelScrollUp" = {
          cooldown-ms = 150;
          action.move-column-to-workspace-up = [ ];
        };

        "Alt+WheelScrollRight".action.focus-column-right = [ ];
        "Alt+WheelScrollLeft".action.focus-column-left = [ ];
        "Alt+Ctrl+WheelScrollRight".action.move-column-right = [ ];
        "Alt+Ctrl+WheelScrollLeft".action.move-column-left = [ ];

        "Alt+Shift+WheelScrollDown".action.focus-column-right = [ ];
        "Alt+Shift+WheelScrollUp".action.focus-column-left = [ ];
        "Alt+Ctrl+Shift+WheelScrollDown".action.move-column-right = [ ];
        "Alt+Ctrl+Shift+WheelScrollUp".action.move-column-left = [ ];

        # Numeric Workspaces
        "Alt+1".action.focus-workspace = 1;
        "Alt+2".action.focus-workspace = 2;
        "Alt+3".action.focus-workspace = 3;
        "Alt+4".action.focus-workspace = 4;
        "Alt+5".action.focus-workspace = 5;
        "Alt+6".action.focus-workspace = 6;
        "Alt+7".action.focus-workspace = 7;
        "Alt+8".action.focus-workspace = 8;
        "Alt+9".action.focus-workspace = 9;

        "Alt+Shift+1".action.move-column-to-workspace = 1;
        "Alt+Shift+2".action.move-column-to-workspace = 2;
        "Alt+Shift+3".action.move-column-to-workspace = 3;
        "Alt+Shift+4".action.move-column-to-workspace = 4;
        "Alt+Shift+5".action.move-column-to-workspace = 5;
        "Alt+Shift+6".action.move-column-to-workspace = 6;
        "Alt+Shift+7".action.move-column-to-workspace = 7;
        "Alt+Shift+8".action.move-column-to-workspace = 8;
        "Alt+Shift+9".action.move-column-to-workspace = 9;

        # Column Consumption/Expulsion
        "Alt+BracketLeft".action.consume-or-expel-window-left = [ ];
        "Alt+BracketRight".action.consume-or-expel-window-right = [ ];
        "Alt+Comma".action.consume-window-into-column = [ ];
        "Alt+Period".action.expel-window-from-column = [ ];

        # Layout Adjustment
        "Alt+R".action.switch-preset-column-width = [ ];
        "Alt+Shift+R".action.switch-preset-window-height = [ ];
        "Alt+Ctrl+R".action.reset-window-height = [ ];
        "Alt+F".action.maximize-column = [ ];
        "Alt+Shift+F".action.fullscreen-window = [ ];
        "Alt+Ctrl+F".action.expand-column-to-available-width = [ ];
        "Alt+Ctrl+C".action.center-visible-columns = [ ];

        "Alt+Minus".action.set-column-width = "-10%";
        "Alt+Equal".action.set-column-width = "+10%";
        "Alt+Shift+Minus".action.set-window-height = "-10%";
        "Alt+Shift+Equal".action.set-window-height = "+10%";

        # Floating/Tiling Switch
        "Alt+V".action.toggle-window-floating = [ ];
        "Alt+Shift+V".action.switch-focus-between-floating-and-tiling = [ ];
        "Alt+W".action.toggle-column-tabbed-display = [ ];

        # Screenshots
        "Alt+S".action.screenshot = [ ];
        "Alt+Shift+S".action.screenshot-window = [ ];

        # System
        "Alt+Escape" = {
          allow-inhibiting = false;
          action.toggle-keyboard-shortcuts-inhibit = [ ];
        };
        "Alt+Shift+E".action.quit = [ ];
        "Ctrl+Alt+Delete".action.quit = [ ];
        "Alt+Shift+P".action.power-off-monitors = [ ];
      };
    };
  };
}
