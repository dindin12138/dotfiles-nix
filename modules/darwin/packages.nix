{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    mas
    eza
    fd
    ripgrep
    gemini-cli
    git
    google-chrome
    zotero
    raycast
    qbittorrent-enhanced
  ];
}
