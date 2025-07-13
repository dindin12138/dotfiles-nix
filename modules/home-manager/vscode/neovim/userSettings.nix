{ pkgs, ... }: {
  "files" = {
    "autoSave" = "afterDelay";
    "autoGuessEncoding" = true;
    "trimTrailingWhitespace" = true;
  };
  "workbench" = {
    "colorTheme" = "Catppuccin Mocha";
    "iconTheme" = "material-icon-theme";
  };
  "editor" = {
    "fontFamily" = "'FiraCode Nerd Font'";
    "fontSize" = 16;
    "formatOnSave" = true;
    "formatOnPaste" = true;
    "formatOnType" = true;
    "tabCompletion" = "on";
    "cursorSmoothCaretAnimation" = "on";
  };
  "editor.minimap.enabled" = false;
  "vscode-neovim" = {
    "neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";
    "NVIM_APPNAME" = "vscode-neovim";
    "compositeKeys" = {
      "jk" = {
        "command" = "vscode-neovim.lua";
        "args" = [
          [
            "local code = require('vscode')"
            "code.action('vscode-neovim.escape')"
            "code.action('workbench.action.files.save')"
          ]
        ];
      };
    };
  };
  "extensions.experimental.affinity" = { "asvetliakov.vscode-neovim" = 1; };
  "whichkey" = {
    "delay" = 200;
    "bindings" = import ./whichkey.nix;
  };
}
