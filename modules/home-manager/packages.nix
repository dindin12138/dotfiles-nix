{ pkgs, ... }:
{
  home.packages = with pkgs; [
    _7zz
    imv
    satty
    typora
    zotero
    qbittorrent-enhanced
    google-chrome
    obsidian
    clash-verge-rev
    # wechat
    godot_4
    obs-studio
    localsend
  ];
}
