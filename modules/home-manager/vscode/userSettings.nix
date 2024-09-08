{ pkgs, ... }:
{
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
    "defaultFormatter" = "esbenp.prettier-vscode";
  };
  "editor.minimap.enabled" = false;
  "[cpp]" = {
    "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
    "editor.quickSuggestions" = {
      "comments" = "on";
      "strings" = "on";
      "other" = "on";
    };
  };
  "[c]" = {
    "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
    "editor.quickSuggestions" = {
      "comments" = "on";
      "strings" = "on";
      "other" = "on";
    };
  };
  "clangd" = {
    "arguments" = [
      "--background-index"
      "--compile-commands-dir=build"
      "-j=12"
      "--clang-tidy"
      "--all-scopes-completion"
      "--completion-style=detailed"
      "--function-arg-placeholders"
      "--header-insertion=iwyu"
      "--pch-storage=memory"
      "--fallback-style=Google"
      "--log=verbose"
      "--pretty"
    ];
    "checkUpdates" = false;
    "path" = "${pkgs.clang-tools}/bin/clangd";
  };
  "cmake" = {
    "configureOnOpen" = true;
    "cmakePath" = "${pkgs.cmake}/bin/cmake";
    "cpackPath" = "${pkgs.cmake}/bin/cpack";
    "ctestPath" = "${pkgs.cmake}/bin/ctest";
    "pinnedCommands" = [
      "workbench.action.tasks.configureTaskRunner"
      "workbench.action.tasks.runTask"
    ];
    "showOptionsMovedNotification" = false;
  };
  "rust-analyzer" = {
    "server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
    "cargo.sysroot" = "discover";
  };
  "ruff.path" = [ "${pkgs.ruff}/bin/ruff" ];
  "[python]" = {
    "editor" = {
      "defaultFormatter" = "charliermarsh.ruff";
      "codeActionsOnSave" = {
        "source.organizeImports.ruff" = "explicit";
      };
    };
  };
  "nix.enableLanguageServer" = true;
  "nix.serverPath" = "${pkgs.nil}/bin/nil";
  "nix.formatterPath" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
  "nix.serverSettings" = {
    "nil" = {
      "diagnostics.ignored" = [
        "unused_binding"
        "unused_with"
      ];
      "formatting.command" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
    };
  };
  "[nix]" = {
    "editor.defaultFormatter" = "jnoortheen.nix-ide";
  };
  "vscode-neovim" = {
    "neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";
    "NVIM_APPNAME" = "vscode-neovim";
  };
  "extensions.experimental.affinity" = {
    "asvetliakov.vscode-neovim" = 1;
  };
}
