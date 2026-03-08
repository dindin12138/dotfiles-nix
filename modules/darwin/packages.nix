{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mas
    eza
    fd
    ripgrep
    qbittorrent-enhanced
  ];
}
