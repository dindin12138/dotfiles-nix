{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [ "--all" ];
    };
  };
  users.users.din.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    lazydocker
  ];
}
