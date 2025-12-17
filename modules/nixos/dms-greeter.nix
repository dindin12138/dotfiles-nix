{ pkgs, config, ... }:
{
  # programs.dankMaterialShell.greeter = {
  services.displayManager.dms-greeter = {
    enable = true;
    configHome = "/home/din";
    compositor = {
      name = "niri"; # Required. Can be also "hyprland" or "sway"
      customConfig = ''
        output "eDP-1" {
            scale 1.5
        }
        hotkey-overlay {
            skip-at-startup
        }
        environment {
            DMS_RUN_GREETER "1"
        }
        cursor {
            xcursor-theme "${config.stylix.cursor.name}"
            xcursor-size ${toString config.stylix.cursor.size}
        }
        gestures {
            hot-corners {
                off
            }
        }
      '';
    };
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };
  users.users.din.extraGroups = [ "greeter" ];
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
