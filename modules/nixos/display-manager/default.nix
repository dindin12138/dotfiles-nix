{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./catppuccin.nix { inherit pkgs; }}";
  };
}
