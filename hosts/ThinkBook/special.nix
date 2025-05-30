{ config, pkgs, lib, ... }: {
  home = {
    packages = with pkgs; [
      (google-chrome.override {
        commandLineArgs = "--force-device-scale-factor=1.5";
      })
      (obsidian.override {
        commandLineArgs = "--force-device-scale-factor=1.5";
      })
    ];
  };

  home = {
    sessionVariables = {
      GDK_DPI_SCALE = "1.6";
      QT_SCALE_FACTOR = "1.5";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };
  };

  gtk = { cursorTheme = { size = lib.mkForce 36; }; };

  home = { pointerCursor = { size = lib.mkForce 36; }; };

  home.file = {
    ".config/fcitx5/conf/classicui.conf".text =
      lib.mkForce (import ../../modules/home-manager/fcitx5/classicui-2k.nix);
  };

  programs.vscode = {
    package = pkgs.vscode.override {
      commandLineArgs = "--force-device-scale-factor=1.5";
    };
  };

  services.hypridle = {
    settings = {
      listener = lib.mkBefore [{
        timeout = 150; # 2.5min.
        on-timeout =
          "${pkgs.brightnessctl}/bin/brightnessctl -sd platform::kbd_backlight set 0"; # turn off keyboard backlight.
        on-resume =
          "${pkgs.brightnessctl}/bin/brightnessctl -rd platform::kbd_backlight"; # turn on keyboard backlight.
      }];
    };
  };

  programs.waybar = {
    style = lib.mkForce
      "${builtins.readFile ../../modules/home-manager/waybar/style-2k.css}";
    settings = {
      mainBar = {
        modules-right = lib.mkForce [
          "bluetooth"
          "pulseaudio"
          "backlight"
          "battery"
          "group/hardware"
          "tray"
          "network"
          "idle_inhibitor"
          "group/power"
          "clock"
        ];
        "tray" = lib.mkForce {
          icon-size = 30;
          spacing = 22;
        };
        "hyprland/window" = {
          icon-size = lib.mkForce 30; # 2k
        };
      };
    };
  };

  programs.kitty = { font = { size = lib.mkForce 20; }; };

  services.mako = {
    settings = {
      font = lib.mkForce "FiraCode Nerd Font 16";
      borderSize = lib.mkForce 3;
      width = lib.mkForce 450;
      height = lib.mkForce 150;
      margin = lib.mkForce "15";
      maxIconSize = lib.mkForce 96;
      padding = lib.mkForce "22";
    };
  };

  programs.wofi = {
    style = lib.mkForce
      "${builtins.readFile ../../modules/home-manager/wofi/style-2k.css}";
    settings = lib.mkForce {
      ## General
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      term = "kitty";

      ## Geometry
      width = "750px";
      height = "457px";
      location = 0;
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;

      ## Images
      allow_markup = true;
      allow_images = true;
      image_size = 36;

      ## Search
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = false;

      ## Other
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;

      ## Keys
      key_expand = "Tab";
      key_exit = "Escape";
    };
  };

  programs.hyprlock = with config.colorScheme.palette; {
    settings = {
      input-field = lib.mkForce [{
        monitor = "";
        size = "375, 90";
        outline_thickness = 3;
        dots_size = 0.3;
        dots_spacing = 0.3;
        dots_center = true;
        outer_color = "0xFF${base05}";
        inner_color = "0x80${base05}";
        font_color = "0xFF${base00}";
        fade_on_empty = false;
        placeholder_text =
          ''<i><span foreground="##${base00}">Input Password...</span></i>'';
        hide_input = false;
        position = "0, -180";
        halign = "center";
        valign = "center";
      }];
      label = lib.mkForce [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%-I:%M%p")"'';
          color = "0xFF${base05}";
          font_size = 150;
          font_family = "FiraCode Nerd Font";
          position = "0, -450";
          halign = "center";
          valign = "top";
        }
        {

          monitor = "";
          text = "Hi there, $USER";
          color = "0xFF${base05}";
          font_size = 37;
          font_family = "FiraCode Nerd Font";
          position = "0, -60";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}

