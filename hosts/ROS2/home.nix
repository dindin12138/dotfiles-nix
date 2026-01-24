{ pkgs, ... }:
{
  imports = [
    ./stylix.nix

    ../../modules/home-manager/shell/bash.nix
    ../../modules/home-manager/shell/default.nix
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/btop.nix
    ../../modules/home-manager/env.nix
    ../../modules/home-manager/gemini.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/nixvim.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/yazi.nix
  ];

  home = {
    username = "din";
    homeDirectory = "/home/din";
  };

  home.packages = with pkgs; [
    eza
    fd
    ripgrep
    fastfetch
    _7zz
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  targets.genericLinux.enable = true;

  nix.package = pkgs.nix;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
