{
  config,
  pkgs,
  lib,
  ...
}:
let
  isLinux = pkgs.stdenv.isLinux;
  isDarwin = pkgs.stdenv.isDarwin;
  uoscFonts = "${pkgs.mpvScripts.uosc}/share/fonts";
in
{
  programs.mpv = {
    enable = true;
    bindings = {
      WHEEL_UP = "seek -10";
      WHEEL_DOWN = "seek 10";
    };
    config = {
      osc = false;
      osd-bar = false;
      border = false;
      keepaspect-window = if isLinux then false else true;
      auto-window-resize = if isLinux then false else true;
      force-window = "immediate";
      save-position-on-quit = true;
      sub-auto = "fuzzy";
      keep-open = true;
      screenshot-directory = "${config.home.homeDirectory}/Pictures/Screenshots";
      gpu-api = "auto";
      gpu-context = "auto";
      hwdec = if isLinux then "auto-safe" else "videotoolbox";
      vo = "gpu-next";
      profile = "gpu-hq";
      video-sync = "display-resample";
      interpolation = true;
      tscale = "mitchell";
      volume-max = 100;
      loop-playlist = "force";
      script-opts = "ytdl_hook-ytdl_path=yt-dlp";
    };
    scripts =
      with pkgs.mpvScripts;
      [
        uosc
        thumbfast
        # mpv-cheatsheet
        autoload
      ]
      ++ (if isLinux then [ mpris ] else [ ]);
    scriptOpts = {
      uosc = {
        scale = 1.5;
        top_bar = "no-border";
        top_bar_controls = "no";
        top_bar_title = "yes";
        autohide = "yes";
        timeline_style = "line";
        timeline_line_width = 2;
        buffered_time_threshold = 60;
        languages = "slang,en";
      };
    };
  };
  xdg.configFile = lib.mkIf isDarwin {
    "mpv/fonts/uosc_icons.otf".source = "${uoscFonts}/uosc_icons.otf";
    "mpv/fonts/uosc_textures.ttf".source = "${uoscFonts}/uosc_textures.ttf";
  };
}
