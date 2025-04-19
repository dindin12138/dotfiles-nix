{ pkgs, ... }: {
  imports = [ ./hyprland.nix ./hyprlock.nix ./hypridle.nix ./hyprpaper.nix ];

  home.packages = with pkgs; [ hyprpicker wl-clipboard ];
}
