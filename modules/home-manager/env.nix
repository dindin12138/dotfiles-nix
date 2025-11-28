{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = false;
  };
  home.packages = with pkgs; [
    devenv
  ];
}
