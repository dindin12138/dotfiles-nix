{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [

    fd
    ripgrep

    eza

    lazydocker

    typora

    zotero

    qbittorrent-enhanced

    clash-verge-rev
    clash-meta

    wechat

    godot_4

    obs-studio
  ];
}
