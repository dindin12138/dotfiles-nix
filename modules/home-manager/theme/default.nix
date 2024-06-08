{ pkgs, ... }:
{
  catppuccin.flavor = "mocha";
  colorScheme = {
    slug = "catppuccin-mocha";
    name = "catppuccin-mocha";
    author = "https://github.com/catppuccin/catppuccin";
    palette = {
      base00 = "1e1e2e"; # base
      base01 = "181825"; # mantle
      base02 = "313244"; # surface0
      base03 = "45475a"; # surface1
      base04 = "585b70"; # surface2
      base05 = "cdd6f4"; # text
      base06 = "f5e0dc"; # rosewater
      base07 = "b4befe"; # lavender
      base08 = "f38ba8"; # red
      base09 = "fab387"; # peach
      base0A = "f9e2af"; # yellow
      base0B = "a6e3a1"; # green
      base0C = "94e2d5"; # teal
      base0D = "89b4fa"; # blue
      base0E = "cba6f7"; # mauve
      base0F = "f2cdcd"; # flamingo};
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        size = "standard";
        accents = [ "blue" ];
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  qt = {
    enable = true;
    style.name = "kvantum";
  };
  home = {
    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
    packages = with pkgs; [
      qt5ct
      (catppuccin-kvantum.override {
        variant = "Mocha";
        accent = "Blue";
      })
    ];
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    file = {
      ".config/Kvantum/kvantum.kvconfig".source = ./kvantum.kvconfig;
      ".config/qt5ct/qt5ct.conf".text = ''
        [Appearance]
        color_scheme_path=${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/Catppuccin-Mocha.conf
        custom_palette=true
        standard_dialogs=default
        style=kvantum-dark

        [Fonts]
        fixed="Sans Serif,11,-1,5,50,0,0,0,0,0"
        general="Sans Serif,11,-1,5,50,0,0,0,0,0"

        [Interface]
        activate_item_on_single_click=1
        buttonbox_layout=0
        cursor_flash_time=1000
        dialog_buttons_have_icons=1
        double_click_interval=400
        gui_effects=@Invalid()
        keyboard_scheme=2
        menus_have_icons=true
        show_shortcuts_in_context_menus=true
        stylesheets=@Invalid()
        toolbutton_style=4
        underline_shortcut=1
        wheel_scroll_lines=3

        [SettingsWindow]
        geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\aq\0\0\x4\x4\0\0\0\0\0\0\0\0\0\0\a\x7f\0\0\x4\x37\0\0\0\0\x2\0\0\0\a\x80\0\0\0\0\0\0\0\0\0\0\aq\0\0\x4\x4)

        [Troubleshooting]
        force_raster_widgets=1
        ignored_applications=@Invalid()
      '';
    };
  };
}

