{ config, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "[░▒▓](#${config.lib.stylix.colors.base07})"
        "[  ](bg:#${config.lib.stylix.colors.base07} fg:#${config.lib.stylix.colors.base00})"
        "[](bg:#${config.lib.stylix.colors.base0D} fg:#${config.lib.stylix.colors.base07})"
        "$directory"
        "[](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base03})"
        "$git_branch"
        "$git_status"
        "[](fg:#${config.lib.stylix.colors.base03} bg:#${config.lib.stylix.colors.base02})"
        "$nodejs"
        "$rust"
        "$golang"
        "$php"
        "$python"
        "$lua"
        "$c"
        "[](fg:#${config.lib.stylix.colors.base02} bg:#${config.lib.stylix.colors.base00})"
        "$nix_shell"
        "$time"
        "[ ](fg:#${config.lib.stylix.colors.base00})"
        ''

          $character''
      ];

      directory = {
        style = "fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D}";
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
        style = "bg:#${config.lib.stylix.colors.base03}";
        format = "[[ $symbol $branch ](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base03})]($style)";
      };

      git_status = {
        style = "bg:#${config.lib.stylix.colors.base03}";
        format = "[[($all_status$ahead_behind )](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base03})]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base02}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base02})]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base02}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base02})]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base02}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base02})]($style)";
      };

      python = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base02}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base02})]($style)";
      };

      lua = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base02}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base02})]($style)";
      };

      c = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base02}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base02})]($style)";
      };

      php = {
        symbol = "";
        style = "bg:#${config.lib.stylix.colors.base02}";
        format = "[[ $symbol ($version) ](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base02})]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#${config.lib.stylix.colors.base00}";
        format = "[[  $time ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base00})]($style)";
      };

      nix_shell = {
        disabled = false;
        impure_msg = "[impure](bold red)";
        pure_msg = "[pure](bold green)";
        unknown_msg = "[unknown](bold yellow)";
        format = "[ 󱄅 $state( ($name))](bold blue) ";
      };
    };
  };
}
