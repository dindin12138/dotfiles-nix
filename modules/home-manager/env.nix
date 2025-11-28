{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = false;
    enableFishIntegration = true;
  };
  home.packages = with pkgs; [
    devenv
  ];
}
