{ config, ... }:
{
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri"; # Or "hyprland" or "sway"
    configHome = "${config.home.homeDirectory}";
  };
}
