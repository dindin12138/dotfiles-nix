{
  programs.niri.settings = {
    window-rules = [
      # Rounded corners (commented out in original)
      {
        geometry-corner-radius = {
          top-left = 20.0;
          top-right = 20.0;
          bottom-left = 20.0;
          bottom-right = 20.0;
        };
        clip-to-geometry = true;
      }
      # Float
      {
        matches = [
          { app-id = "^com-evacipated-cardcrawl-modthespire-Loader$"; }
          {
            app-id = "^steam$";
            title = "^(Steam 设置|特惠|Steam Settings|Special Offers)$";
          }
          {
            app-id = "^wechat$";
            title = "^(Photos and Videos|Settings|Open)$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [
          { app-id = "^float-term$"; }
          { app-id = "^imv$"; }
          {
            app-id = "^google-chrome$";
            title = "^(Open Files?|Save( File| As)?)$";
          }
          {
            app-id = "^org\\.gnome\\.Nautilus$";
            title = "^(Open Files?|Save( File| As)?)$";
          }
          {
            app-id = "^org\\.qbittorrent\\.qBittorrent$";
            title = "^Magnet link$";
          }
        ];
        open-floating = true;
        default-column-width = {
          proportion = 0.75;
        };
        default-window-height = {
          proportion = 0.75;
        };
      }
      # WezTerm workaround
      {
        matches = [ { app-id = "^org\\.wezfurlong\\.wezterm$"; } ];
        default-column-width = { };
      }
      # Firefox Picture-in-Picture
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
      }
      # Zotero Dialogs
      {
        matches = [ { app-id = "^Zotero$"; } ];
        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "^Zotero$";
            title = "Zotero$";
          }
        ];
        open-floating = false;
      }
      {
        matches = [
          {
            app-id = "^Zotero$";
            title = "^(Create Parent Item|New Collection)$";
          }
        ];
        default-column-width = {
          proportion = 0.29;
        };
        default-window-height = {
          proportion = 0.19;
        };
      }
      {
        matches = [
          {
            app-id = "^Zotero$";
            title = "^Progress$";
          }
        ];
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
      }
      {
        matches = [
          {
            app-id = "^steam$";
            title = "^(好友列表|Friends List)$";
          }
        ];
        default-column-width = {
          proportion = 0.2;
        };
      }
    ];
  };
}
