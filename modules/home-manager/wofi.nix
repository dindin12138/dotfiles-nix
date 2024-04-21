{
  programs.wofi = {
    enable = true;
    settings = {
      ## General
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      term = "kitty";

      ## Geometry
      width = "500px";
      height = "305px";
      location = 0;
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;

      ## Images
      allow_markup = true;
      allow_images = true;
      image_size = 24;

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
    style = "
            /* -----------------------------------------------------
            * Import colors 
            * ----------------------------------------------------- */

            @define-color color0 #1e1e2e;
            @define-color color1 #262636;
            @define-color color2 #d9e0ee;
            @define-color color3 #89b4fa;
            @define-color color4 #f38ba8;
            @define-color color5 #cba6f7;

            /** ********** Fonts ********** **/

            * {
            font-family: FiraCode Nerd Font;
            font-size: 13px;
            }

            #window {
            background-color: @color0;
            color: @color2;
            border: 2px solid @color1;
            border-radius: 0px;
            }

            #outer-box {
            padding: 20px;
            }

            #input {
            background-color: @color1;
            border: 0px solid @color3;
            padding: 8px 12px;
            }

            #scroll {
            margin-top: 20px;
            }

            #inner-box {
            }

            #img {
            padding-right: 8px;
            }

            #text {
            color: @color2;
            }

            #text:selected {
            color: @color0;
            }

            #entry {
            padding: 6px;
            }

            #entry:selected {
            background-color: @color3;
            color: @color0;
            }

            #unselected {
            }

            #selected {
            }

            #input,
            #entry:selected {
            border-radius: 4px;
            }
        ";
  };
}
