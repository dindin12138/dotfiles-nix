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
    ./window-rules.nix
    ./binds.nix
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
      # screenshot-path = "${config.home.homeDirectory}/Pictures/Screenshots/%Y%m%d-%H%M%S.png";
      screenshot-path = "${config.home.homeDirectory}/InfiniCloud/Picture/Screenshots/%Y%m%d-%H%M%S.png";

      # --- Animations ---
      animations = {
        enable = true;
        slowdown = 2.0;
      };

      # --- xwayland ---
      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite;
      };

      # --- Debug ---
      debug = {
        # Allows notification actions and window activation from Noctalia.
        honor-xdg-activation-with-invalid-serial = [ ];
      };

      # --- Layer Rules ---
      layer-rules = [
        {
          matches = [ { namespace = "^noctalia-overview*"; } ];
          place-within-backdrop = true;
        }
      ];
    };
  };
}
