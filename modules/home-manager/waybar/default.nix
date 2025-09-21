{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = "${builtins.readFile ./style.css}";
    settings = {
      hyprbar = import ./hyprbar.nix;
      niribar = import ./niribar.nix;
    };
  };
}
