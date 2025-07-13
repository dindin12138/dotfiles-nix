{ pkgs, ... }: {
  "files" = {
    "autoSave" = "afterDelay";
    "autoGuessEncoding" = true;
    "trimTrailingWhitespace" = true;
  };
  "workbench" = {
    "colorTheme" = "Catppuccin Mocha";
    "iconTheme" = "material-icon-theme";
    "startupEditor" = "none";
  };
  "workbench.activityBar.location" = "hidden";
  "editor" = {
    "fontFamily" = "'FiraCode Nerd Font'";
    "fontSize" = 16;
    "formatOnSave" = true;
    "formatOnPaste" = true;
    "formatOnType" = true;
    "tabCompletion" = "on";
    "cursorSmoothCaretAnimation" = "on";
    "defaultFormatter" = "esbenp.prettier-vscode";
  };
  "editor.minimap.enabled" = false;
  # "vscode-neovim" = {
  #   "neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";
  #   "NVIM_APPNAME" = "vscode-neovim";
  # };
  # "extensions.experimental.affinity" = { "asvetliakov.vscode-neovim" = 1; };
  "markdown.preview.fontSize" = 16;
  "markdown-preview-github-styles.colorTheme" = "light";
}
