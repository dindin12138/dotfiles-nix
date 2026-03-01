{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
