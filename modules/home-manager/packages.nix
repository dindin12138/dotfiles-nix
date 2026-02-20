{ pkgs, ... }:
{
  home.packages = with pkgs; [
    _7zz
    imv
    satty
    zotero
    qbittorrent-enhanced
    google-chrome
    obsidian
    clash-verge-rev
    wechat
    godot_4
    obs-studio
    localsend
    (typora.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        wrapProgram $out/bin/typora \
          --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --wayland-text-input-version=3"
      '';
    }))
  ];
}
