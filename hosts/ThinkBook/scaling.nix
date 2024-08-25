{ lib, ... }:
{
  home = {
    sessionVariables = {
      GDK_DPI_SCALE = "1.5";
      QT_SCALE_FACTOR = "1.5";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };
  };

  programs.kitty = {
    font = {
      size = lib.mkForce 19;
    };
  };
  programs.hyprlock = {
    settings = {
      input-field = [
        {
          size = lib.mkForce "375, 90";
          outline_thickness = lib.mkForce 3;
          dots_size = lib.mkForce 0.3;
          dots_spacing = lib.mkForce 0.3;
          position = lib.mkForce "0, -180";
        }
      ];
      label = [
        {
          font_size = lib.mkForce 150;
          position = lib.mkForce "0, -450";
        }
        {
          font_size = lib.mkForce 37;
          position = lib.mkForce "0, -60";
        }
      ];
    };
  };
}
