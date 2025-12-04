{ pkgs, config, ... }:
{
  programs.nh = {
    enable = true;
    clean = {
      enable = pkgs.stdenv.isLinux;
      extraArgs = "--keep-since 7d --keep 3";
    };
    flake = "${config.home.homeDirectory}/Workspace/dotfiles-nix";
  };
}
