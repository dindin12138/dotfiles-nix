{ pkgs, ... }: {
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "qt5ct";
  };
  home = {
    packages = with pkgs; [
      libsForQt5.qt5ct
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
        icon_theme=Papirus-Dark
        style=kvantum-dark
        [Fonts]
        fixed="FiraCode Nerd Font,11,-1,5,50,0,0,0,0,0"
        general="FiraCode Nerd Font,11,-1,5,50,0,0,0,0,0"
      '';
    };
  };
}
