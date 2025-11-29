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
        seekbarfg_color = "#${config.lib.stylix.colors.base0D}";
        hover_effect_color = "#${config.lib.stylix.colors.base0D}";
        playlist_button = "yes";
        fadein = "yes";
      };
    };
  };
}
