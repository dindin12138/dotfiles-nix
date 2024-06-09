{ inputs, config, ... }:
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.nix-colors.homeManagerModules.default

    ../../modules/home-manager/hyprland
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/waybar
    ../../modules/home-manager/wofi
    ../../modules/home-manager/shell.nix
    ../../modules/home-manager/yazi
    # ../../modules/home-manager/joshuto
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/packages.nix
    ../../modules/home-manager/firefox
    ../../modules/home-manager/fcitx5
    ../../modules/home-manager/neovim
    ../../modules/home-manager/btop.nix
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/theme
    ../../modules/home-manager/wall
    ../../modules/home-manager/mako.nix
    ../../modules/home-manager/wezterm
    ../../modules/home-manager/screenshot
    ../../modules/home-manager/vscode.nix
    ../../modules/home-manager/tmux.nix
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "din";
    homeDirectory = "/home/din";
  };

  xdg.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      XDG_WORKSPACE_DIR = "${config.home.homeDirectory}/Workspace";
      XDG_SCREENSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
    };
  };

  services.udiskie.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
