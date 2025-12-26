{ config, ... }:
{
  stylix.targets.fzf.enable = true;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
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
