# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs, outputs, lib, config, pkgs, ... }:
{

  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    inputs.home-manager.nixosModules.home-manager

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ../../modules/nixos/display-manager
    ../../modules/nixos/polkit.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      din = import ./home.nix;
    };
  };

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
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_1);

  boot.supportedFilesystems = [ "ntfs" ];

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";


  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    din = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      # initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    killall
    gcc
    clang
    gdb
  ];

  fonts.packages = with pkgs; [
    source-han-sans
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code-nerdfont
  ];

  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-chinese-addons
      ];
    };
  };

  systemd.services.nix-daemon.environment = {
    http_proxy = "http://192.168.0.106:7890";
    https_proxy = "http://192.168.0.106:7890";
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      # PasswordAuthentication = false;
    };
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.tlp.enable = true;
  services.auto-cpufreq.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      offload.enable = true;
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:03:00:0";
    };
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    fontPackages = with pkgs; [ source-han-sans ];
    extraPackages = with pkgs; [ mangohud ];
  };

  programs.gamemode.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      # thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };
  services.tumbler.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
