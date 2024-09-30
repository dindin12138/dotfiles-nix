{ config, ... }:
{
  programs.mpv = {
    enable = true;
    bindings = { };
    config = {
      save-position-on-quit = true;
      save-file-auto = "fuzzy";
      sub-auto = "fuzzy";
      keep-open = true;
      screenshot-directory = "${config.home.homeDirectory}/Pictures/Screenshots";
    };
  };
}
