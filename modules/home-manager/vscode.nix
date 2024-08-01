{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      pkief.material-icon-theme
      llvm-vs-code-extensions.vscode-clangd
      ms-vscode.cmake-tools
      vadimcn.vscode-lldb
      rust-lang.rust-analyzer
      eamodio.gitlens
      alefragnani.project-manager
      gruntfuggly.todo-tree
      jnoortheen.nix-ide
      esbenp.prettier-vscode
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-docker
    ];
    userSettings = {
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
      };
      "rust-analyzer" = {
        "server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        "cargo.sysroot" = "discover";
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
    };
    userTasks = {
      version = "2.0.0";
      tasks = [
        {
          label = "cmake";
          type = "shell";
          command = "${pkgs.cmake}/bin/cmake";
          args = [
            "-B build"
          ];
        }
        {
          label = "make";
          options = {
            cwd = "\${workspaceFolder}/build";
          };
          group = {
            kind = "build";
            isDefault = true;
          };
          command = "${pkgs.gnumake}/bin/make";
          args = [ ];
        }
        {
          label = "cmake & make compile";
          dependsOrder = "sequence";
          dependsOn = [
            "cmake"
            "make"
          ];
        }
        {
          label = "clang single file compile";
          type = "process";
          command = "${pkgs.clang}/bin/clang++";
          args = [
            "\${file}"
            "-g"
            "-Wall"
            # "-stdlib=libc++"
            "-std=c++11"
            "-o"
            "\${workspaceFolder}/build/\${fileBasenameNoExtension}"
          ];
          group = {
            kind = "build";
            isDefault = true;
          };
          options = {
            cwd = "\${fileDirname}";
          };
          presentation = {
            echo = true;
            reveal = "always";
            focus = false;
            panel = "shared";
          };
        }
      ];
    };
  };
}
