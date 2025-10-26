{ pkgs, ... }:
let
  colorScheme = "catppuccin-mocha";
in
{
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${colorScheme}.yaml";
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 13;
      };
    };
    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
    };
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
