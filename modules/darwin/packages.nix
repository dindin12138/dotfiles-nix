{ pkgs, ... }:
{
  home-manager.users.din.home.packages = with pkgs; [
    mas
    eza
    fd
    ripgrep
    lazygit
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    git
    kitty
    google-chrome
    zotero
    vscode
    raycast
    qbittorrent-enhanced
    mpv-unwrapped
    wezterm
    aerospace
  ];
}
