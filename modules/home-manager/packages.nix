{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd
    ripgrep

    eza

    lazygit
    lazydocker

    google-chrome
    fastfetch
    mpv
    vlc
    typora
    obsidian
    zotero
    zed-editor
    clash-verge-rev
    qbittorrent-qt5
  ];
}
