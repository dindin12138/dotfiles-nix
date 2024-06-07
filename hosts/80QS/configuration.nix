{ inputs, outputs, pkgs, ... }:
{
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    inputs.home-manager.nixosModules.home-manager

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
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
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/networking.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      din = import ./home.nix;
    };
  };

  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_1);

  boot.supportedFilesystems = [ "ntfs" ];

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      offload.enable = true;
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:03:00:0";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
