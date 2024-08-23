{
  programs.wofi = {
    enable = true;
    style = ''${builtins.readFile ./style.css}'';
    settings = {
      ## General
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      term = "kitty";

      ## Geometry
      # width = "500px";
      # height = "305px";
      width = "750px";
      height = "457px";
      location = 0;
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;

      ## Images
      allow_markup = true;
      allow_images = true;
      # image_size = 24;
      image_size = 36;

      ## Search
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = false;

      ## Other
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;

      ## Keys
      key_expand = "Tab";
      key_exit = "Escape";
    };
  };
}
