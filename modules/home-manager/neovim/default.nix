{ pkgs, ... }:
{
  imports = [
    # ./neovim.nix
    ./nixvim.nix
  ];
}
