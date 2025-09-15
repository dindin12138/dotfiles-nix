{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    extraConfig = "${builtins.readFile ./wezterm.lua}";
  };
}
