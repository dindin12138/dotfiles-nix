{
  inputs,
  config,
  ...
}:
{
  imports = [
    # inputs.stylix.homeModules.stylix
    inputs.niri.homeModules.niri
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.zen-browser.homeModules.twilight
    inputs.vicinae.homeManagerModules.default

    ../../modules/home-manager/niri
    ../../modules/home-manager/vicinae.nix
    ../../modules/home-manager/shell
    ../../modules/home-manager/yazi.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/packages.nix
    ../../modules/home-manager/fcitx5.nix
    ../../modules/home-manager/neovim
    ../../modules/home-manager/btop.nix
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/stylix.nix
    ../../modules/home-manager/wall
    ../../modules/home-manager/vscode
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/music
    ../../modules/home-manager/mpv.nix
    ../../modules/home-manager/yt-dlp.nix
    ../../modules/home-manager/qutebrowser.nix
    ../../modules/home-manager/foot.nix
    ../../modules/home-manager/ghostty.nix
    ../../modules/home-manager/dms.nix
    ../../modules/home-manager/udisk.nix
    ../../modules/home-manager/zed.nix
    ../../modules/home-manager/zen.nix
    ../../modules/home-manager/env.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "din";
    homeDirectory = "/home/din";
    sessionVariables = {
      GOPATH = "${config.home.homeDirectory}/.cache/go";
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_WORKSPACE_DIR = "${config.home.homeDirectory}/Workspace";
        XDG_SCREENSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
      };
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
