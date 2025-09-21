{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [

    fd
    ripgrep

    eza

    lazygit
    lazydocker

    typora

    zotero

    qbittorrent-enhanced

    google-chrome

    obsidian

    clash-verge-rev
    clash-meta

    wechat

    godot_4

    obs-studio
  ];
}
