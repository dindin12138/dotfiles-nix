{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  home.packages = with pkgs; [
    hyprpicker
    brightnessctl
    wl-clipboard
  ];
}
