{
  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 15;
    };
    efi.canTouchEfiVariables = true;
  };
}
