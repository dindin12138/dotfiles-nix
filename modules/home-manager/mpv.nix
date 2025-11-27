{ config, pkgs, ... }:
let
  isLinux = pkgs.stdenv.isLinux;
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  programs.mpv = {
    enable = true;
    bindings = {
      WHEEL_UP = "seek -10";
      WHEEL_DOWN = "seek 10";
      # h = "seek -1";
      # l = "seek 1";
      # H = "seek -5";
      # L = "seek 5";
      # g = "seek 0 absolute-percent";
      # G = "seek 100 absolute-percent";
    };
    config = {
      osc = false;
      save-position-on-quit = true;
      sub-auto = "fuzzy";
      keep-open = true;
      screenshot-directory = "${config.home.homeDirectory}/Pictures/Screenshots";
      gpu-api = if isLinux then "opengl" else "auto";
      gpu-context = if isLinux then "wayland" else "auto";
      hwdec = if isLinux then "auto-safe" else "videotoolbox";
      vo = "gpu-next";
      profile = "gpu-hq";
      script-opts = "ytdl_hook-ytdl_path=yt-dlp";
    };
    scripts = with pkgs.mpvScripts; [
      modernz
      thumbfast
      mpv-cheatsheet
    ];
    scriptOpts = {
      modernz = {
        seekbarfg_color = "#7fc8ff";
        playlist_button = "yes";
      };
    };
  };
}
