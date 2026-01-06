{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    profiles = {
      default = import ./default/profile.nix { inherit pkgs lib; };
      CPP = import ./cpp/profile.nix { inherit pkgs lib; };
      Go = import ./go/profile.nix { inherit pkgs lib; };
      Python = import ./python/profile.nix { inherit pkgs lib; };
      Markdown = import ./markdown/profile.nix { inherit pkgs lib; };
    };
  };
}
