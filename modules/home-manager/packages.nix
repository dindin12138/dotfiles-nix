{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [

    fd
    ripgrep

    imv

    satty

    eza

    lazygit

    lazydocker

    typora

    zotero

    qbittorrent-enhanced

    google-chrome

    obsidian

    clash-verge-rev

    # flclash

    xwayland-satellite

    nautilus

    gemini-cli

    wechat

    godot_4

    obs-studio
  ];
}
