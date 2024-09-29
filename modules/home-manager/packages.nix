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

    typora
    obsidian

    zotero_7

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
