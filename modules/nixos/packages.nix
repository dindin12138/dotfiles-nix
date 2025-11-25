{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    killall
    file
    wl-clipboard
    fd
    ripgrep
    eza
  ];
}
