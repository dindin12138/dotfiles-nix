{
  programs.ncmpcpp = {
    enable = true;
    settings = {
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "mpd_visualizer";

      visualizer_in_stereo = "yes";
      visualizer_fps = "60";
      visualizer_type = "ellipse";
      visualizer_look = "●●";
      visualizer_color = "33,39,63,75,81,99,117,153,189";
      visualizer_spectrum_smooth_look = "yes";

      # GENERAL
      # ---
      connected_message_on_startup = "yes";
      cyclic_scrolling = "yes";
      mouse_support = "no";
      mouse_list_scroll_whole_page = "yes";
      lines_scrolled = "1";
      message_delay_time = "1";
      playlist_shorten_total_times = "yes";
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      playlist_editor_display_mode = "columns";
      autocenter_mode = "yes";
      centered_cursor = "yes";
      user_interface = "classic";
      follow_now_playing_lyrics = "yes";
      locked_screen_width_part = "50";
      ask_for_locked_screen_width_part = "yes";
      display_bitrate = "no";
      external_editor = "nano";
      main_window_color = "default";
      startup_screen = "playlist";

      # PROGRESS BAR
      # ---
      progressbar_look = "▪▪▪";
      #progressbar_look = "▃▃▃";
      progressbar_elapsed_color = "magenta";
      progressbar_color = "black";

      # UI VISIBILITY
      # ---
      header_visibility = "no";
      statusbar_visibility = "yes";
      titles_visibility = "yes";
      enable_window_title = "yes";

      # COLORS
      # ---
      statusbar_color = "white";
      color1 = "white";
      color2 = "blue";

      # UI APPEARANCE
      # ---
      now_playing_prefix = "$b$2$7 ";
      now_playing_suffix = "  $/b$8";
      current_item_prefix = "$b$7$/b$3 ";
      current_item_suffix = "  $8";

      song_columns_list_format = "(50)[]{t|fr:Title} (0)[magenta]{a}";
      song_list_format = " {%t $R   $8%a$8}|{%f $R   $8%l$8} $8";
      song_status_format = "$b$2󰣐 $7 {$b$6$8 %t $6} $7 $8";
      song_window_title_format = "Now Playing ..";
    };
  };
}
