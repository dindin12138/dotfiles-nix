{ config, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "${config.home.homeDirectory}/Pictures/Wallpapers/background-blur.png" ];

      wallpaper = [ ",${config.home.homeDirectory}/Pictures/Wallpapers/background-blur.png" ];
    };
  };
}
