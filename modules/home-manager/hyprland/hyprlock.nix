{ inputs, pkgs, ... }:
{
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    general = {
      no_fade_in = false;
      grace = 0;
      disable_loading_bar = true;
    };
    backgrounds = [
      {
        monitor = "";
        path = "screenshot";
        blur_passes = 3;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      }
    ];
    input-fields = [
      {
        monitor = "";
        size = {
          width = 250;
          height = 60;
        };
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        placeholder_text = "<i><span foreground=\"##cdd6f4\">Input Password...</span></i>";
        hide_input = false;
        position = {
          x = 0;
          y = -120;
        };
        halign = "center";
        valign = "center";
      }
    ];
    labels = [
      {
        monitor = "";
        text = "cmd[update:1000] echo \"$(date +\"%-I:%M%p\")\"";
        color = "rgba(200, 200, 200, 1.0)";
        #color = rgba(255, 255, 255, 0.6)
        font_size = 100;
        font_family = "FiraCode Nerd Font";
        position = {
          x = 0;
          y = -300;
        };
        halign = "center";
        valign = "top";
      }
      {
        monitor = "";
        text = "Hi there, $USER";
        color = "rgba(200, 200, 200, 1.0)";
        #color = rgba(255, 255, 255, 0.6)
        font_size = 25;
        font_family = "FiraCode Nerd Font";
        position = {
          x = 0;
          y = -40;
        };
        halign = "center";
        valign = "center";
      }
    ];
  };
}
