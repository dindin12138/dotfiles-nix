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

    zotero_7

    # wechat-uos
    # zed-editor

    # clash-verge-rev
    # clash-meta

    qbittorrent-enhanced

    telegram-desktop

    qq

    minecraft

    godot_4
    blender
  ];
}
