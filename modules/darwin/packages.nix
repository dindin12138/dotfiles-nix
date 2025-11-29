{ pkgs, ... }:
{
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
