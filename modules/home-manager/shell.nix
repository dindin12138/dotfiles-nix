{ lib, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "exa";
      la = "exa -lha --group-directories-first --git";
      ll = "exa -lh --group-directories-first --git";
      lt = "exa -T --git-ignore --level=2 --group-directories-first";

      ra = "yazi";
      nf = "fastfetch";
      astronvim = "NVIM_APPNAME=astronvim nvim";
      # vim = "nvim";
      # vi = "nvim";
      cat = "bat";
      icat = "kitty +kitten icat";
      lg = "lazygit";

      fc = "cliphist list | fzf | cliphist decode | wl-copy";

      nixos-rebuild-flake = "sudo nixos-rebuild switch --flake";
      nixos-update-flake = "nix flake update && sudo nixos-rebuild switch --flake";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
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
    fileWidgetOptions = [
      "--prompt=' FZF 󰄾 '"
      "--height 50%"
      "--layout reverse"
      "--border rounded"
    ];
    historyWidgetOptions = [
      "--prompt=' FZF 󰄾 '"
      "--height 50%"
      "--layout reverse"
      "--border rounded"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = with config.colorScheme.palette; {
      format = lib.concatStrings [
        "[░▒▓](#${base07})"
        "[  ](bg:#${base07} fg:#${base00})"
        "[](bg:#${base0D} fg:#${base07})"
        "$directory"
        "[](fg:#${base0D} bg:#${base03})"
        "$git_branch"
        "$git_status"
        "[](fg:#${base03} bg:#${base02})"
        "$nodejs"
        "$rust"
        "$golang"
        "$php"
        "[](fg:#${base02} bg:#${base00})"
        "$time"
        "[ ](fg:#${base00})"
        "\n$character"
      ];

      directory = {
        style = "fg:#${base05} bg:#${base0D}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
        "Public" = " ";
        "Desktop" = " ";
        "Templates" = " ";
        "Videos" = " ";
        "Workspace" = " ";
      };

      git_branch = {
        symbol = "";
        style = "bg:#${base03}";
        format = "[[ $symbol $branch ](fg:#${base0D} bg:#${base03})]($style)";
      };

      git_status = {
        style = "bg:#${base03}";
        format = "[[($all_status$ahead_behind )](fg:#${base0D} bg:#${base03})]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#${base02}";
        format = "[[ $symbol ($version) ](fg:#${base0D} bg:#${base02})]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#${base02}";
        format = "[[ $symbol ($version) ](fg:#${base0D} bg:#${base02})]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:#${base02}";
        format = "[[ $symbol ($version) ](fg:#${base0D} bg:#${base02})]($style)";
      };

      php = {
        symbol = "";
        style = "bg:#${base02}";
        format = "[[ $symbol ($version) ](fg:#${base0D} bg:#${base02})]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#${base00}";
        format = "[[  $time ](fg:#${base05} bg:#${base00})]($style)";
      };
    };
  };
}
