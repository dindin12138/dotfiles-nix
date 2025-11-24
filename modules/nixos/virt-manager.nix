{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      runAsRoot = true;
      swtpm.enable = true;
    };
  };
  programs.virt-manager.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    OVMF
  ];
  users.users.din.extraGroups = [ "libvirtd" ];
}
