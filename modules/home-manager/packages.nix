{ pkgs, ... }:
{
  home.packages = with pkgs; [
    imv
    satty
    typora
    zotero
    qbittorrent-enhanced
    google-chrome
    obsidian
    clash-verge-rev
    nautilus
    gemini-cli
    wechat
    godot_4
    obs-studio
  ];
}
