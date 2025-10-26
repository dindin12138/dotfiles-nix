{ pkgs, config, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "catppuccin-mocha-blue";
    settings = {
      Theme = {
        CursorTheme = "${config.stylix.cursor.name}";
        CursorSize = "${toString (config.stylix.cursor.size + 18)}";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    bibata-cursors
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "blue";
      font = "${config.stylix.fonts.monospace.name}";
      fontSize = "${toString (config.stylix.fonts.sizes.desktop + 4)}";
      background = "${../home-manager/wall/wallpapers/background.png}";
      loginBackground = false;
    })
  ];
}
