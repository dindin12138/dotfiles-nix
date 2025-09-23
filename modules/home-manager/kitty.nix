{
  home.sessionVariables.TERMINAL = "kitty";
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 15;
    };
    themeFile = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
    };
  };
}
