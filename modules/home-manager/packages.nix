{ pkgs, ... }:
{
  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    google-chrome
    fastfetch
    # bat
    eza
    lazygit
    fd
    ripgrep
    # pamixer
    brightnessctl
    # light
    # xfce.thunar
    wl-clipboard
    mpv
    vlc
    typora
    obsidian
    zotero
    zed-editor
    clash-verge-rev
  ];

  services.cliphist.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;
}
