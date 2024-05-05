# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, config, ... }:
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule
    inputs.catppuccin.homeManagerModules.catppuccin

    # You can also split up your configuration and import pieces of it here:
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
    ../../modules/home-manager/theme.nix
    ../../modules/home-manager/wall
    ../../modules/home-manager/mako.nix
    ../../modules/home-manager/wezterm.nix
    ../../modules/home-manager/screenshot
  ];

  catppuccin.flavour = "mocha";

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
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

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
