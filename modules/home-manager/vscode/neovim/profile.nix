{ pkgs, ... }: {
  userSettings = import ./userSettings.nix { inherit pkgs; };
  keybindings = import ./keybindings.nix;
  extensions = with pkgs.vscode-extensions; [
    # Theme
    catppuccin.catppuccin-vsc
    pkief.material-icon-theme

    # Neovim
    asvetliakov.vscode-neovim
    vspacecode.whichkey
  ];
}
