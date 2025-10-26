{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "catppuccin-mocha-blue";
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 36;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    bibata-cursors
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "blue";
      font = "FiraCode Nerd Font";
      fontSize = "16";
      # background = "${../../home-manager/wall/wallpapers/background.png}";
      # loginBackground = false;
    })
  ];
}
