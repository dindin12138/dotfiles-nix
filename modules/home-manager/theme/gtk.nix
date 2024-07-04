{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      # name = "Catppuccin-Mocha-Standard-Blue-Dark";
      name = "catppuccin-mocha-blue-standard+default";
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
}
