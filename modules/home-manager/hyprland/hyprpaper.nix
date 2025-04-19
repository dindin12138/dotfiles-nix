{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      # splash_offset = 2.0;

      preload = [ "../wall/wallpapers/background.png" ];

      wallpaper = [ "monitor1,../wall/wallpapers/background.png" ];
    };
  };
}
