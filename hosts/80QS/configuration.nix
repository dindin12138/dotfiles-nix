{ inputs, outputs, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko

    ./hardware-configuration.nix
    # ./disk-config.nix

    ../../modules/nixos/bootloader.nix
    ../../modules/nixos/fcitx5.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/display-manager
    ../../modules/nixos/polkit.nix
    ../../modules/nixos/packages.nix
    ../../modules/nixos/powermanager.nix
    # ../../modules/nixos/proxy.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/sound.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/thunar.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/networking.nix
    # ../../modules/nixos/docker.nix
    # ../../modules/nixos/virt-manager.nix
  ];

  # services.desktopManager.cosmic.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = { din = import ./home.nix; };
  };

  # boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_1);

  boot.supportedFilesystems = [ "ntfs" ];

  time = {
    # timeZone = "Asia/Shanghai";
    timeZone = "Europe/London";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    prime = {
      offload.enable = true;
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:03:00:0";
    };
  };

  virtualisation.docker.enable = true;

  # enable wayland support in chromium and electron
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
