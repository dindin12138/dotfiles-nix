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

    # Go
    golang.go

    # Tools
    eamodio.gitlens
    alefragnani.project-manager
    gruntfuggly.todo-tree

    # Formatter
    esbenp.prettier-vscode

    # Remote & Docker
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-containers
    ms-azuretools.vscode-docker
  ];
}
