{ config, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    colors = with config.colorScheme.palette; {
      "bg+" = "#${base02}";
      bg = "#${base00}";
      spinner = "#${base06}";
      hl = "#${base08}";
      fg = "#${base05}";
      header = "#${base08}";
      info = "#${base0E}";
      pointer = "#${base06}";
      marker = "#${base06}";
      "fg+" = "#${base05}";
      prompt = "#${base0E}";
      "hl+" = "#${base08}";
    };
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
