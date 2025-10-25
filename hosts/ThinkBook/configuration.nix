{ inputs, outputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko

    ./hardware-configuration.nix
    ./disk-config.nix

    ../../modules/nixos/bootloader.nix
    ../../modules/nixos/fcitx5.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/display-manager
    ../../modules/nixos/polkit.nix
    ../../modules/nixos/packages.nix
    ../../modules/nixos/powermanager.nix
    ../../modules/nixos/proxy.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/sound.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/thunar.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/niri.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/docker.nix
    ../../modules/nixos/virt-manager.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/time.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      din = import ./home.nix;
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.videoDrivers = [ "amdgpu" ];
  programs.dconf.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
