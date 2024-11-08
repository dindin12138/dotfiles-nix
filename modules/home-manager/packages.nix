{ inputs, pkgs, ... }: {
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

    qbittorrent-enhanced

    follow

    inputs.st.packages.x86_64-linux.default

    # clash-verge-rev
    # clash-meta

    telegram-desktop

    qq

    whatsapp-for-linux

    minecraft

    godot_4
    blender
  ];
}
