{ pkgs, ... }:
{
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.gnome.sushi.enable = true;
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };
  environment.systemPackages = with pkgs; [
    nautilus
  ];
  # programs.thunar = {
  #   enable = true;
  #   plugins = with pkgs.xfce; [
  #     # thunar-archive-plugin
  #     thunar-media-tags-plugin
  #     thunar-volman
  #   ];
  # };
  # services.tumbler.enable = true;
}
