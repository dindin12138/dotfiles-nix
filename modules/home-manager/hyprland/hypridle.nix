{ inputs, pkgs, ... }:
{
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];
  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;
    # General
    lockCmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
    beforeSleepCmd = "loginctl lock-session"; # lock before suspend.
    afterSleepCmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
    listeners = [
      {
        timeout = 180; # 3min.
        onTimeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
        onResume = "brightnessctl -r"; # monitor backlight restor.
      }
      {
        timeout = 300; # 5min
        onTimeout = "loginctl lock-session"; # lock screen when timeout has passed
      }
      {
        timeout = 360; # 6min
        onTimeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
        onResume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
      }
      {
        timeout = 1800; # 30min
        onTimeout = "systemctl suspend"; # suspend pc
      }
    ];
  };
}
