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

    flclash

    xwayland-satellite

    # v2rayn
    # xray

    # clash-meta

    wechat

    godot_4

    obs-studio
  ];
}
