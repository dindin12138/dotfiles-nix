{
  programs.yazi = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      manager = {
        ratio = [ 1 2 4 ];
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = false;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
        scrolloff = 5;
      };
      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        image_filter = "triangle";
        image_quality = 75;
        sixel_fraction = 15;
        ueberzug_scale = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };
    };
  };
}
