{ config, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload =
        [ "${config.home.homeDirectory}/Pictures/Wallpapers/background.png" ];

      wallpaper =
        [ ",${config.home.homeDirectory}/Pictures/Wallpapers/background.png" ];
    };
  };
}
