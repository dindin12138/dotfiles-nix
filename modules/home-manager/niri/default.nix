{ pkgs, config, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    config = builtins.readFile ./config.kdl;
    # settings = {
    #   input = {
    #     keyboard.numlock = true;
    #     touchpad = {
    #       tap = true;
    #       natural-scroll = true;
    #     };
    #   };
    #   outputs = {
    #     "eDP-1" = {
    #       mode = {
    #         height = 1800;
    #         width = 2880;
    #         refresh = 90.000;
    #       };
    #       scale = 1.5;
    #       variable-refresh-rate = "on-demand";
    #     };
    #   };
    #   layout = {
    #     gaps = 10;
    #     center-focused-column = "on-overflow";
    #     preset-column-widths = [
    #       { proportion = 4.5 / 10.; }
    #       { proportion = 5.5 / 10.; }
    #     ];
    #     default-column-width = { };
    #     focus-ring = {
    #       width = 3;
    #       active = { color = "#7fc8ff"; };
    #       inactive = { color = "#505050"; };
    #     };
    #     border.enable = false;
    #     shadow.enable = false;
    #   };
    #   hotkey-overlay.skip-at-startup = true;
    #   prefer-no-csd = true;
    #   screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    #   animations.slowdown = 2.0;
    #   # window-rules = { };
    #   binds = with config.lib.niri.actions; {
    #     "Alt+Shift+Slash".action = show-hotkey-overlay;
    #     "Alt+T" = {
    #       action = spawn "foot";
    #       hotkey-overlay.title = "Open a Terminal: foot";
    #     };
    #     "Alt+Return" = {
    #       action = spawn "foot";
    #       hotkey-overlay.title = "Open a Terminal: foot";
    #     };
    #     "Alt+D" = {
    #       action = spawn "wofi";
    #       hotkey-overlay.title = "Run an Application: wofi";
    #     };
    #     "Alt+E" = {
    #       action = spawn "thunar";
    #       hotkey-overlay.title = "Open Thunar File Manager";
    #     };
    #     "Super+Alt+L" = {
    #       action = spawn "dms" "ipc" "call" "lock" "lock";
    #       hotkey-overlay.title = "Lock Screen";
    #     };
    #     "Alt+C" = {
    #       action = spawn "dms" "ipc" "call" "clipboard" "toggle";
    #       hotkey-overlay.title = "Clipboard Manager";
    #     };
    #     "Alt+Shift+X" = {
    #       action = spawn "dms" "ipc" "call" "powermenu" "toggle";
    #       hotkey-overlay.title = "Power Menu";
    #     };
    #     "Mod+C" = {
    #       action = spawn "dms" "ipc" "call" "control-center" "toggle";
    #       hotkey-overlay.title = "Control Center";
    #     };
    #     "XF86AudioRaiseVolume" = {
    #       action = spawn "dms" "ipc" "call" "audio" "increment" "3";
    #       allow-when-locked = true;
    #     };
    #     "XF86AudioLowerVolume" = {
    #       action = spawn "dms" "ipc" "call" "audio" "decrement" "3";
    #       allow-when-locked = true;
    #     };
    #     "XF86AudioMute" = {
    #       action = spawn "dms" "ipc" "call" "audio" "mute";
    #       allow-when-locked = true;
    #     };
    #     "XF86AudioMicMute" = {
    #       action = spawn "dms" "ipc" "call" "audio" "micmute";
    #       allow-when-locked = true;
    #     };
    #     "XF86MonBrightnessUp" = {
    #       action = spawn "dms" "ipc" "call" "brightness" "increment" "5";
    #       allow-when-locked = true;
    #     };
    #     "XF86MonBrightnessDown" = {
    #       action = spawn "dms" "ipc" "call" "brightness" "decrement" "5";
    #       allow-when-locked = true;
    #     };
    #     "Alt+O" = {
    #       action = toggle-overview;
    #       repeat = false;
    #       hotkey-overlay.title = "Open/close the Overview";
    #     };
    #     "Alt+Shift+Q" = {
    #       action = close-window;
    #       repeat = false;
    #       hotkey-overlay.title = "Close the window";
    #     };

    #     "Alt+H".action = focus-column-left;
    #     "Alt+J".action = focus-window-down;
    #     "Alt+K".action = focus-window-up;
    #     "Alt+L".action = focus-column-right;
    #     "Alt+Left".action = focus-column-left;
    #     "Alt+Down".action = focus-window-down;
    #     "Alt+Up".action = focus-window-up;
    #     "Alt+Right".action = focus-column-right;

    #     "Alt+Shift+H".action = move-column-left;
    #     "Alt+Shift+J".action = move-window-down;
    #     "Alt+Shift+K".action = move-window-up;
    #     "Alt+Shift+L".action = move-column-right;
    #     "Alt+Shift+Left".action = move-column-left;
    #     "Alt+Shift+Down".action = move-window-down;
    #     "Alt+Shift+Up".action = move-window-up;
    #     "Alt+Shift+Right".action = move-column-right;

    #     "Alt+Tab".action = focus-workspace-down;
    #     "Alt+Shift+Tab".action = focus-workspace-up;

    #     "Alt+WheelScrollDown" = {
    #       action = focus-workspace-down;
    #       cooldown-ms = 150;
    #     };
    #     "Alt+WheelScrollUp" = {
    #       action = focus-workspace-up;
    #       cooldown-ms = 150;
    #     };
    #     "Alt+Ctrl+WheelScrollDown" = {
    #       action = move-column-to-workspace-down;
    #       cooldown-ms = 150;
    #     };
    #     "Alt+Ctrl+WheelScrollUp" = {
    #       action = move-column-to-workspace-up;
    #       cooldown-ms = 150;
    #     };

    #     "Alt+1".action = focus-workspace 1;
    #     "Alt+2".action = focus-workspace 2;
    #     "Alt+3".action = focus-workspace 3;
    #     "Alt+4".action = focus-workspace 4;
    #     "Alt+5".action = focus-workspace 5;
    #     "Alt+6".action = focus-workspace 6;
    #     "Alt+7".action = focus-workspace 7;
    #     "Alt+8".action = focus-workspace 8;
    #     "Alt+9".action = focus-workspace 9;

    #     "Alt+Shift+1".action = move-column-to-workspace 1;
    #     "Alt+Shift+2".action = move-column-to-workspace 2;
    #     "Alt+Shift+3".action = move-column-to-workspace 3;
    #     "Alt+Shift+4".action = move-column-to-workspace 4;
    #     "Alt+Shift+5".action = move-column-to-workspace 5;
    #     "Alt+Shift+6".action = move-column-to-workspace 6;
    #     "Alt+Shift+7".action = move-column-to-workspace 7;
    #     "Alt+Shift+8".action = move-column-to-workspace 8;
    #     "Alt+Shift+9".action = move-column-to-workspace 9;

    #     "Alt+BracketLeft".action = consume-or-expel-window-left;
    #     "Alt+BracketRight".action = consume-or-expel-window-right;
    #     "Alt+Comma".action = consume-window-into-column;
    #     "Alt+Period".action = expel-window-from-column;

    #     "Alt+R".action = switch-preset-column-width;
    #     "Alt+Shift+R".action = switch-preset-window-height;
    #     "Alt+Ctrl+R".action = reset-window-height;
    #     "Alt+F".action = maximize-column;
    #     "Alt+Shift+F".action = fullscreen-window;
    #     "Alt+Ctrl+F".action = expand-column-to-available-width;
    #     "Alt+Ctrl+C".action = center-visible-columns;

    #     "Alt+Minus".action = set-column-width "-10%";
    #     "Alt+Equal".action = set-column-width "+10%";
    #     "Alt+Shift+Minus".action = set-window-height "-10%";
    #     "Alt+Shift+Equal".action = set-window-height "+10%";

    #     "Alt+V".action = toggle-window-floating;
    #     "Alt+Shift+V".action = switch-focus-between-floating-and-tiling;

    #     "Alt+W".action = toggle-column-tabbed-display;

    #     # "Print".action = screenshot;
    #     # "Ctrl+Print".action = screenshot-screen;
    #     # "Alt+Print".action = screenshot-window;

    #     "Alt+Escape" = {
    #       action = toggle-keyboard-shortcuts-inhibit;
    #       allow-inhibiting = false;
    #     };
    #     "Alt+Shift+P".action = power-off-monitors;
    #   };
    # };
  };
}
