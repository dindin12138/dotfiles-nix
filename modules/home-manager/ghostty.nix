{ pkgs, config, ... }:
let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  stylix.targets.ghostty.enable = true;
  programs.ghostty = {
    enable = true;
    package = if isDarwin then null else pkgs.ghostty;
    enableZshIntegration = true;
    enableFishIntegration = true;
    installBatSyntax = if isDarwin then false else true;
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
