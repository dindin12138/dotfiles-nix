{ lib, ... }:
{
  stylix.targets.foot.enable = true;
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = lib.mkForce "FiraCode Nerd Font:size=13";
        box-drawings-uses-font-glyphs = "yes";
        # dpi-aware = "yes";
      };
      cursor = {
        style = "beam";
        blink = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
