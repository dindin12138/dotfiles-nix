{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    userSettings = import ./userSettings.nix { inherit pkgs; };
    userTasks = import ./userTasks.nix { inherit pkgs; };
    extensions = with pkgs.vscode-extensions; [
      # Theme
      catppuccin.catppuccin-vsc
      pkief.material-icon-theme

      # C / C++
      llvm-vs-code-extensions.vscode-clangd
      ms-vscode.cmake-tools

      # Rust
      rust-lang.rust-analyzer

      # Go
      golang.go

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

      # Debug
      vadimcn.vscode-lldb

      # Tools
      eamodio.gitlens
      alefragnani.project-manager
      gruntfuggly.todo-tree

      # NIX
      jnoortheen.nix-ide

      # Formatter
      esbenp.prettier-vscode

      # Remote & Docker
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-docker

      # Neovim
      asvetliakov.vscode-neovim
    ];
  };
}
