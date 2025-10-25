{ config, ... }:
{
  stylix.targets.fzf.enable = true;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # colors = {
    #   "bg+" = "#${config.lib.stylix.colors.base02}";
    #   bg = "#${config.lib.stylix.colors.base00}";
    #   spinner = "#${config.lib.stylix.colors.base06}";
    #   hl = "#${config.lib.stylix.colors.base08}";
    #   fg = "#${config.lib.stylix.colors.base05}";
    #   header = "#${config.lib.stylix.colors.base08}";
    #   info = "#${config.lib.stylix.colors.base0E}";
    #   pointer = "#${config.lib.stylix.colors.base06}";
    #   marker = "#${config.lib.stylix.colors.base06}";
    #   "fg+" = "#${config.lib.stylix.colors.base05}";
    #   prompt = "#${config.lib.stylix.colors.base0E}";
    #   "hl+" = "#${config.lib.stylix.colors.base08}";
    # };
    defaultCommand = "fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist,vendor} --type f";
    defaultOptions = [
      "--prompt=' FZF 󰄾 '"
      "--height 50%"
      "--layout reverse"
      "--border rounded"
    ];
    # CTRL-T
    fileWidgetOptions = [
      "--prompt=' FZF 󰄾 '"
      "--height 50%"
      "--layout reverse"
      "--border rounded"
    ];
    # CTRL-R
    historyWidgetOptions = [
      "--prompt=' FZF 󰄾 '"
      "--height 50%"
      "--layout reverse"
      "--border rounded"
    ];
  };
}
