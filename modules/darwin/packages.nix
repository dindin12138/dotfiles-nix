{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mas
    eza
    fd
    ripgrep
    google-chrome
    zotero
    raycast
    qbittorrent-enhanced
    localsend
    obsidian
  ];
}
