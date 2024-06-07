{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    fontPackages = with pkgs; [ noto-fonts-cjk noto-fonts-emoji ];
    extraPackages = with pkgs; [ mangohud ];
  };
  programs.gamemode.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}

