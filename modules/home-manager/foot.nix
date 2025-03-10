{
  catppuccin.foot.enable = true;
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "FiraCode Nerd Font:size=20";
        box-drawings-uses-font-glyphs = "yes";
        # dpi-aware = "yes";
      };
      cursor = {
        style = "beam";
        blink = "yes";
      };
      mouse = { hide-when-typing = "yes"; };
    };
  };
}
