{ pkgs, config, ... }:
let
  isLinux = pkgs.stdenv.isLinux;
in
{
  stylix.targets.ghostty.enable = true;
  programs.ghostty = {
    enable = true;
    package = if isLinux then pkgs.ghostty else pkgs.ghostty-bin;
    enableZshIntegration = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    settings = {
      "macos-titlebar-style" = "transparent";
      "macos-option-as-alt" = true;
      "window-padding-x" = 10;
      "window-padding-y" = "10, 0";
      "mouse-hide-while-typing" = true;
      "copy-on-select" = true;
      "cursor-style" = "bar";
      "cursor-style-blink" = true;
      "font-size" = config.stylix.fonts.sizes.terminal;
    };
  };
}
