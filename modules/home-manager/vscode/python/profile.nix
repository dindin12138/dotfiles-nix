{ pkgs, lib, ... }:
let
  commonConfig = import ../userSettings.nix;
  specificConfig = import ./userSettings.nix { inherit pkgs; };
in
{
  userSettings = lib.recursiveUpdate commonConfig specificConfig;
  userTasks = import ./userTasks.nix { inherit pkgs; };
  extensions = with pkgs.vscode-extensions; [
    # Theme
    catppuccin.catppuccin-vsc
    pkief.material-icon-theme

    # Python
    # ms-python.python
    # ms-python.vscode-pylance
    charliermarsh.ruff

    # Jupyter
    ms-toolsai.jupyter
    ms-toolsai.vscode-jupyter-slideshow
    ms-toolsai.vscode-jupyter-cell-tags
    ms-toolsai.jupyter-renderers
    ms-toolsai.jupyter-keymap

    # Tools
    eamodio.gitlens
    alefragnani.project-manager
    gruntfuggly.todo-tree

    # Remote & Docker
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-containers
    ms-azuretools.vscode-docker
  ];
}
