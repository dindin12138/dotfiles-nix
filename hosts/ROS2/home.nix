{ pkgs, ... }:
{
  imports = [
    ./stylix.nix

    ../../modules/home-manager/nix.nix
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

  stylix.targets.ghostty.enable = true;
  programs.ghostty = {
    enable = true;
    package = null;
    systemd.enable = false;
    enableFishIntegration = true;
    settings = {
      "macos-titlebar-style" = "transparent";
      "macos-option-as-alt" = true;
      "window-padding-x" = 10;
      "window-padding-y" = "10, 0";
      "mouse-hide-while-typing" = true;
      "copy-on-select" = true;
      "cursor-style" = "bar";
      "cursor-style-blink" = true;
    };
  };

  targets.genericLinux.enable = true;

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
