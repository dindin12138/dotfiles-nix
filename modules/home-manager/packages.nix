{
  # inputs,
  pkgs,
  ...
}:
# let
#   system = pkgs.stdenv.hostPlatform.system;
#   nvim = inputs.nixvim.packages.${system}.default;
#   st = inputs.st.packages.${system}.default;
# in
{
  home.packages = with pkgs; [
    fd
    ripgrep

    eza

    lazygit
    lazydocker

    # superfile

    # (google-chrome.override { commandLineArgs = "--force-device-scale-factor=1.5"; })
    # (obsidian.override { commandLineArgs = "--force-device-scale-factor=1.5"; })

    fastfetch

    typora

    zotero

    qbittorrent-enhanced

    clash-verge-rev
    clash-meta

    # telegram-desktop

    # qq

    wechat

    # minecraft

    godot_4
    # blender

    obs-studio
  ];
}
