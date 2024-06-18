{ config, lib, ... }:
{
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
