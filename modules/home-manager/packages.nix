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

    # zotero
    zotero_7

    # zed-editor

    clash-verge-rev
    clash-meta

    qbittorrent-qt5
  ];
}
