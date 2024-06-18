{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd
    ripgrep

    eza

    google-chrome
    fastfetch
    lazygit
    mpv
    vlc
    typora
    obsidian
    zotero
    zed-editor
    clash-verge-rev
  ];
}
