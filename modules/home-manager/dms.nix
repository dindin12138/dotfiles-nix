{ inputs, config, ... }:
{
  programs.dankMaterialShell = {
    enable = true;
    systemd.enable = true;
    enableDynamicTheming = false;
    enableVPN = false;
    enableColorPicker = false;
    enableClipboard = false;
    plugins = {
      dank-actions = {
        enable = true;
        src = "${inputs.dms-plugins}/DankActions";
      };
    };
    default.settings = {
      "wallpaperFillMode" = "Fill";
      "blurredWallpaperLayer" = true;

      "currentThemeName" = "cat-blue";
      "customThemeFile" = "${config.home.homeDirectory}/.config/DankMaterialShell/theme.json";

      "showClipboard" = false;

      "use24HourClock" = true;

      "clockDateFormat" = "ddd MMM d";
      "lockDateFormat" = "ddd MMM d";

      "weatherEnabled" = true;
      "useAutoLocation" = false;
      "useFahrenheit" = false;

      # Dank Bar
      "barConfigs" = [
        {
          "id" = "default";
          "name" = "Main Bar";
          "enabled" = true;
          "position" = 0;
          "screenPreferences" = [
            "all"
          ];
          "showOnLastDisplay" = true;
          "leftWidgets" = [
            "launcherButton"
            "workspaceSwitcher"
            "focusedWindow"
          ];
          "centerWidgets" = [
            {
              "enabled" = true;
              "id" = "music";
            }
            "clock"
            "weather"
          ];
          "rightWidgets" = [
            {
              "enabled" = true;
              "id" = "systemTray";
            }
            {
              "enabled" = true;
              "id" = "cpuUsage";
              "minimumWidth" = false;
            }
            {
              "enabled" = true;
              "id" = "memUsage";
              "minimumWidth" = false;
            }
            "notificationButton"
            "battery"
            {
              "enabled" = true;
              "id" = "controlCenterButton";
              "showAudioIcon" = true;
              "showBluetoothIcon" = false;
              "showNetworkIcon" = true;
            }
            {
              "enabled" = true;
              "id" = "idleInhibitor";
            }
          ];
          "spacing" = 0;
          "innerPadding" = 8;
          "bottomGap" = 0;
          "transparency" = 1;
          "widgetTransparency" = 1;
          "squareCorners" = true;
          "noBackground" = false;
          "gothCornersEnabled" = false;
          "gothCornerRadiusOverride" = false;
          "fontScale" = 1.1;
          "autoHide" = false;
          "openOnOverview" = true;
          "visible" = true;
          "popupGapsAuto" = false;
          "popupGapsManual" = 7;
        }
      ];

      "showWorkspaceIndex" = false;
      "workspaceScrolling" = false;
      "showWorkspacePadding" = false;
      "showWorkspaceApps" = false;
      "workspacesPerMonitor" = true;

      "notificationPopupPosition" = 0;

      "cornerRadius" = 15;

      "fontFamily" = "${config.stylix.fonts.monospace.name}";
      "monoFontFamily" = "${config.stylix.fonts.monospace.name}";
      "fontWeight" = 400;
      "fontScale" = 1.1;

      "syncModeWithPortal" = true;
      "iconTheme" = "System Default";

      "lockScreenShowPowerActions" = true;
      "loginctlLockIntegration" = true;
      "lockBeforeSuspend" = true;

      "launcherLogoMode" = "os";
      "launcherLogoColorOverride" = "primary";

      # Popup
      "popupTransparency" = 1;

      # Dock
      "showDock" = false;
    };
  };
}
