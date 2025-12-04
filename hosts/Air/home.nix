{
  imports = [
    ../../modules/home-manager/shell
    ../../modules/home-manager/yazi.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/nixvim.nix
    ../../modules/home-manager/btop.nix
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/yt-dlp.nix
    ../../modules/home-manager/vscode
    ../../modules/home-manager/ghostty.nix
    ../../modules/home-manager/zed.nix
    ../../modules/home-manager/mpv.nix
    ../../modules/home-manager/nh.nix
  ];

  home = {
    username = "din";
    homeDirectory = "/Users/din";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
