{ pkgs, ... }: {
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "qt6ct";
  };
  home = {
    packages = with pkgs; [
      # libsForQt5.qt5ct
      kdePackages.qt6ct
      (catppuccin-kvantum.override {
        variant = "mocha";
        accent = "blue";
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
        custom_palette=false
        icon_theme=Papirus-Dark
        standard_dialogs=default
        style=kvantum-dark

        [Fonts]
        fixed="FiraCode Nerd Font,11,-1,5,50,0,0,0,0,0"
        general="FiraCode Nerd Font,11,-1,5,50,0,0,0,0,0"

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
      ".config/qt6ct/qt6ct.conf".text = ''
        [Appearance]
        color_scheme_path=${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/Catppuccin-Mocha.conf
        custom_palette=true
        icon_theme=Papirus-Dark
        standard_dialogs=default
        style=kvantum

        [Fonts]
        fixed="FiraCode Nerd Font,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
        general="FiraCode Nerd Font,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"

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
        geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x3T\0\0\x4~\0\0\0\0\0\0\0\0\0\0\ar\0\0\x4~\0\0\0\0\x2\0\0\0\a\x80\0\0\0\0\0\0\0\0\0\0\x3T\0\0\x4~)

        [Troubleshooting]
        force_raster_widgets=1
        ignored_applications=@Invalid()
      '';
    };
  };
}
