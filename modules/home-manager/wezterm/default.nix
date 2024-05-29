{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''${builtins.readFile ./style.css}'';
  };
}

