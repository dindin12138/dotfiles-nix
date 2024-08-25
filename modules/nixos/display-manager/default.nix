{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./catppuccin.nix { inherit pkgs; }}";
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 36;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
