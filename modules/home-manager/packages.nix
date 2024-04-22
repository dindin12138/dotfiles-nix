{ pkgs, ... }:
{
  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    google-chrome
    fastfetch
    bat
    eza
    lazygit
    fd
    ripgrep
  ];

  programs.vscode.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;
}
