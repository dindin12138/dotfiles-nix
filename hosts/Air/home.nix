{
  inputs,
  ...
}:
{
  imports = [
    inputs.stylix.homeModules.stylix

    ../../modules/home-manager/shell
    ../../modules/home-manager/yazi
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/theme/catppuccin.nix
    ../../modules/home-manager/neovim
    ../../modules/home-manager/btop.nix
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/yt-dlp.nix
    ../../modules/home-manager/vscode
    ../../modules/home-manager/wezterm
  ];

  home = {
    username = "din";
    homeDirectory = "/Users/din";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
