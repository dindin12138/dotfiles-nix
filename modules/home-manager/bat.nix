{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
    # config = {
    #   theme = "Catppuccin Mocha";
    # };
    # themes = {
    #   "Catppuccin Mocha" = {
    #     src = pkgs.fetchFromGitHub {
    #       owner = "catppuccin";
    #       repo = "bat";
    #       rev = "2bafe4454d8db28491e9087ff3a1382c336e7d27";
    #       sha256 = "sha256-yHt3oIjUnljARaihalcWSNldtaJfVDfmfiecYfbzGs0=";
    #     };
    #     file = "themes/Catppuccin Mocha.tmTheme";
    #   };
    # };
  };
}
