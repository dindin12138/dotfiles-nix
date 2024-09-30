{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd
    ripgrep

    eza

    lazygit
    lazydocker

    superfile

    google-chrome

    fastfetch

    typora
    obsidian

    zotero_7

    # clash-verge-rev
    # clash-meta

    telegram-desktop

    qq

    minecraft

    godot_4
    blender
  ];
}
