{ pkgs, ... }: {
  userSettings = import ./userSettings.nix { inherit pkgs; };
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

    # Neovim
    # asvetliakov.vscode-neovim
  ];
}
