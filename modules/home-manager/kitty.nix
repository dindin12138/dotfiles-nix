{
  home.sessionVariables.TERMINAL = "kitty";
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 13;
    };
    theme = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    settings = {
      confirm_os_window_close = 0;
    };
  };
}
