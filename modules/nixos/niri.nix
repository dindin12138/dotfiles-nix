{ pkgs, ... }:
{
  programs.niri.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
