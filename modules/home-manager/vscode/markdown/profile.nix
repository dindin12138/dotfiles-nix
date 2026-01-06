{ pkgs, lib, ... }:
let
  commonConfig = import ../userSettings.nix;
  specificConfig = import ./userSettings.nix { inherit pkgs; };
in
{
  userSettings = lib.recursiveUpdate commonConfig specificConfig;
  extensions = with pkgs.vscode-extensions; [
    # Theme
    catppuccin.catppuccin-vsc
    pkief.material-icon-theme

    foam.foam-vscode
    yzhang.markdown-all-in-one
    bierner.markdown-mermaid
    bierner.markdown-preview-github-styles

    # Formatter
    esbenp.prettier-vscode

    # christian-kohler.path-intellisense
  ];
}
