{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    fontPackages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
    extraPackages = with pkgs; [
      mangohud
    ];
  };
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
