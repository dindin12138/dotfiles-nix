{
  programs.niri.settings = {
    window-rules = [
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
      }
      # Float Term
      {
        matches = [ { app-id = "^float-term$"; } ];
        open-floating = true;
        default-column-width = {
          proportion = 0.75;
        };
        default-window-height = {
          proportion = 0.75;
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
      # Chrome Open Files
      {
        matches = [
          {
            app-id = "^google-chrome$";
            title = "^Open Files$";
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
      # qBittorrent Magnet Link
      {
        matches = [
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
      # Nautilus "Open Files" Dialog
      {
        matches = [
          {
            app-id = "^org\\.gnome\\.Nautilus$";
            title = "^Open Files$";
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
      {
        matches = [
          { app-id = "^imv$"; }
        ];
        open-floating = true;
        default-column-width = {
          proportion = 0.75;
        };
        default-window-height = {
          proportion = 0.75;
        };
      }
      # mpv Video Player (Auto-size)
      # {
      #   matches = [ { app-id = "^mpv$"; } ];
      #   open-floating = true;
      # }
      # Rounded corners (commented out in original)
      {
        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };
        clip-to-geometry = true;
      }
    ];
  };
}
