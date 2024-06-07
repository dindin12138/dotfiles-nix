{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      # thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };
  services.tumbler.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
