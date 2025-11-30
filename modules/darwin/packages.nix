{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mas
    eza
    fd
    ripgrep
    gemini-cli
    google-chrome
    zotero
    raycast
    qbittorrent-enhanced
  ];
}
