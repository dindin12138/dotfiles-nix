{ pkgs, ... }: {
  imports = [ ./mpd.nix ./ncmpcpp.nix ];
  home.packages = with pkgs; [ rmpc ];
}
