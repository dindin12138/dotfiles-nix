{
  stylix.targets.kitty.enable = true;
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
    settings = {
      confirm_os_window_close = 0;
    };
  };
}
