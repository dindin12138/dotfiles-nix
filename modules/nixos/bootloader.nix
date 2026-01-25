{
  boot = {
    loader = {
      systemd-boot.enable = false;
      grub.enable = false;
      refind = {
        enable = true;
        extraConfig = ''
          timeout 5
          resolution 1920 1200
          dont_scan_dirs EFI/BOOT
          default_selection "NixOS default profile"
        '';
      };
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "ntfs" ];
  };
}
