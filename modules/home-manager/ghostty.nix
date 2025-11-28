{
  stylix.targets.ghostty.enable = true;
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    systemd.enable = true;
    settings = {
      "macos-titlebar-style" = "transparent";
      "macos-option-as-alt" = true;
      "window-padding-x" = 10;
      "window-padding-y" = 10;
      "mouse-hide-while-typing" = true;
      "copy-on-select" = true;
      "cursor-style" = "bar";
      "cursor-style-blink" = true;
    };
  };
}
