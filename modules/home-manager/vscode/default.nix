{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles = {
      default = import ./default/profile.nix { inherit pkgs; };
      CPP = import ./cpp/profile.nix { inherit pkgs; };
      Python = import ./python/profile.nix { inherit pkgs; };
      Markdown = import ./markdown/profile.nix { inherit pkgs; };
      Neovim = import ./neovim/profile.nix { inherit pkgs; };
    };
  };
}
