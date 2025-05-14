{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    fd
    ripgrep

    eza

    lazygit
    lazydocker

    superfile

    # (google-chrome.override { commandLineArgs = "--force-device-scale-factor=1.5"; })
    # (obsidian.override { commandLineArgs = "--force-device-scale-factor=1.5"; })

    fastfetch

    typora

    zotero

    qbittorrent-enhanced

    # follow

    inputs.st.packages.x86_64-linux.default
    # inputs.zen-browser.packages."${system}".default

    # clash-verge-rev
    # clash-meta

    telegram-desktop

    # qq

    # whatsapp-for-linux

    # minecraft

    godot_4
    # blender

    obs-studio
  ];
}
