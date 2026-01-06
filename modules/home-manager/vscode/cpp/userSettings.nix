{ pkgs, ... }:
{
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
}
