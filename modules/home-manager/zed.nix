{ pkgs, ... }:
{
  stylix.targets.zed.enable = true;
  programs.zed-editor = {
    enable = true;
    extensions = [ ];
    extraPackages = with pkgs; [ ];
  };
}
