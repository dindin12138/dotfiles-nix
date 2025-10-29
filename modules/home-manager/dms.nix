{ config, ... }:
{
  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableDynamicTheming = false;
    default.settings = {
      "wallpaperFillMode" = "Fill";
      "blurredWallpaperLayer" = true;

      "use24HourClock" = true;

      "clockDateFormat" = "ddd MMM d";
      "lockDateFormat" = "ddd MMM d";

      "weatherEnabled" = true;
      "useAutoLocation" = true;
      "useFahrenheit" = false;

      # Dank Bar
      "dankBarPosition" = 0;
      "dankBarAutoHide" = false;
      "dankBarOpenOnOverview" = true;

      "dankBarTransparency" = 1;
      "dankBarWidgetTransparency" = 1;

      "dankBarSpacing" = 0;
      "dankBarBottomGap" = 0;
      "dankBarInnerPadding" = 8;

      "dankBarSquareCorners" = true;
      "dankBarNoBackground" = false;
      "dankBarGothCornersEnabled" = false;
      "dankBarBorderEnabled" = false;

      "dankBarFontScale" = 1.1;

      "dankBarLeftWidgets" = [
        "launcherButton"
        "workspaceSwitcher"
        "focusedWindow"
      ];

      "dankBarCenterWidgets" = [
        {
          "id" = "music";
          "enabled" = true;
        }
        "clock"
        "weather"
      ];

      "dankBarRightWidgets" = [
        {
          "id" = "systemTray";
          "enabled" = true;
        }
        "clipboard"
        {
          "id" = "cpuUsage";
          "enabled" = true;
          "minimumWidth" = false;
        }
        {
          "id" = "memUsage";
          "enabled" = true;
          "minimumWidth" = false;
        }
        "notificationButton"
        "battery"
        {
          "id" = "controlCenterButton";
          "enabled" = true;
          "showNetworkIcon" = true;
          "showBluetoothIcon" = true;
          "showAudioIcon" = true;
        }
        {
          "id" = "idleInhibitor";
          "enabled" = true;
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

      # Popup
      "popupTransparency" = 1;
      "popupGapsAuto" = false;
      "popupGapsManual" = 7;

      # Dock
      "showDock" = false;
    };
  };
}
