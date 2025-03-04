{ config, ... }: {
  programs.mpv = {
    enable = true;
    bindings = {
      WHEEL_UP = "seek -10";
      WHEEL_DOWN = "seek 10";
      h = "seek -1";
      l = "seek 1";
      H = "seek -5";
      L = "seek 5";
      g = "seek 0 absolute-percent";
      G = "seek 100 absolute-percent";
    };
    config = {
      save-position-on-quit = true;
      sub-auto = "fuzzy";
      keep-open = true;
      screenshot-directory =
        "${config.home.homeDirectory}/Pictures/Screenshots";
      gpu-api = "opengl";
      gpu-context = "wayland";
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
      script-opts = "ytdl_hook-ytdl_path=yt-dlp";
    };
  };
}
