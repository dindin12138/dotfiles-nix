[
  {
    "key" = " ";
    "name" = "Commands";
    "type" = "command";
    "command" = "workbench.action.showCommands";
  }
  {
    "key" = "?";
    "name" = "Search keybindings";
    "type" = "command";
    "command" = "whichkey.searchBindings";
  }
  {
    "key" = "b";
    "name" = "+Buffers/Editors";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "c";
        "name" = "Close active editor";
        "type" = "command";
        "command" = "workbench.action.closeActiveEditor";
      }
      {
        "key" = "k";
        "name" = "Close other editors";
        "type" = "command";
        "command" = "workbench.action.closeOtherEditors";
      }
    ];
  }
  {
    "key" = "c";
    "name" = "Close Active Editor";
    "type" = "command";
    "command" = "workbench.action.closeActiveEditor";
  }
  {
    "key" = "k";
    "name" = "Close Other Editor";
    "type" = "command";
    "command" = "workbench.action.closeOtherEditors";
  }
  {
    "key" = "e";
    "name" = "+Errors";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = ".";
        "name" = "Error transient";
        "type" = "command";
        "command" = "whichkey.showTransient";
        "args" = "whichkey.transient.error";
      }
      {
        "key" = "l";
        "name" = "List errors";
        "type" = "command";
        "command" = "workbench.actions.view.problems";
      }
      {
        "key" = "n";
        "name" = "Next error";
        "type" = "command";
        "command" = "editor.action.marker.next";
      }
      {
        "key" = "p";
        "name" = "Previous error";
        "type" = "command";
        "command" = "editor.action.marker.prev";
      }
      {
        "key" = "o";
        "name" = "Open Explorer";
        "type" = "command";
        "command" = "workbench.view.explorer";
      }
            {
        "key" = "h";
        "name" = "Hide Explorer";
        "type" = "command";
        "command" = "workbench.action.closeSidebar";
      }
            {
        "key" = "t";
        "name" = "Toggle Explorer";
        "type" = "command";
        "command" = "workbench.action.toggleSidebarVisibility";
      }
    ];
  }
  {
    "key" = "f";
    "name" = "+File";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "s";
        "name" = "Save file";
        "type" = "command";
        "command" = "workbench.action.files.save";
      }
      {
        "key" = "S";
        "name" = "Save all files";
        "type" = "command";
        "command" = "workbench.action.files.saveAll";
      }
      {
        "key" = "r";
        "name" = "Rename file";
        "type" = "commands";
        "commands" =
          [ "workbench.files.action.showActiveFileInExplorer" "renameFile" ];
      }
      {
        "key" = "t";
        "name" = "Show active file in tree/explorer view";
        "type" = "command";
        "command" = "workbench.files.action.showActiveFileInExplorer";
      }
      {
        "key" = "y";
        "name" = "Copy path of active file";
        "type" = "command";
        "command" = "workbench.action.files.copyPathOfActiveFile";
      }
      {
        "key" = "f";
        "name" = "Format file";
        "type" = "command";
        "command" = "editor.action.formatDocument";
      }
    ];
  }
  {
    "key" = "g";
    "name" = "+Git";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "b";
        "name" = "Checkout [b]ranch";
        "type" = "command";
        "command" = "git.checkout";
      }
      {
        "key" = "c";
        "name" = "Commit";
        "type" = "command";
        "command" = "git.commit";
      }
      {
        "key" = "d";
        "name" = "Delete Branch";
        "type" = "command";
        "command" = "git.deleteBranch";
      }
      {
        "key" = "f";
        "name" = "Fetch";
        "type" = "command";
        "command" = "git.fetch";
      }
      {
        "key" = "i";
        "name" = "Init";
        "type" = "command";
        "command" = "git.init";
      }
      {
        "key" = "s";
        "name" = "Status";
        "type" = "command";
        "command" = "workbench.view.scm";
      }
      {
        "key" = "g";
        "name" = "Gitlens Graph";
        "type" = "command";
        "command" = "gitlens.showGraphPage";
      }
    ];
  }
  {
    "key" = "m";
    "name" = "+Bookmark";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "t";
        "name" = "Toggle Bookmark";
        "type" = "command";
        "command" = "bookmarks.toggle";
      }
      {
        "key" = "l";
        "name" = "List Bookmark";
        "type" = "command";
        "command" = "bookmarks.list";
      }
      {
        "key" = "n";
        "name" = "Next Bookmark";
        "type" = "command";
        "command" = "bookmarks.jumpToNext";
      }
      {
        "key" = "p";
        "name" = "Previous Bookmark";
        "type" = "command";
        "command" = "bookmarks.jumpToPrevious";
      }
    ];
  }
  {
    "key" = "p";
    "name" = "+Project";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "f";
        "name" = "Find file in project";
        "type" = "command";
        "command" = "workbench.action.quickOpen";
      }
      {
        "key" = "p";
        "name" = "Switch project";
        "type" = "command";
        "command" = "workbench.action.openRecent";
      }
      {
        "key" = "t";
        "name" = "Show tree/explorer view";
        "type" = "command";
        "command" = "workbench.view.explorer";
      }
    ];
  }
  {
    "key" = "s";
    "name" = "+Search";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "t";
        "name" = "Search text in a project";
        "type" = "command";
        "command" = "workbench.action.findInFiles";
      }
      {
        "key" = "p";
        "name" = "Search in a project with a selection";
        "type" = "commands";
        "commands" = [
          "editor.action.addSelectionToNextFindMatch"
          "workbench.action.findInFiles"
        ];
      }
      {
        "key" = "r";
        "name" = "Search all references";
        "type" = "command";
        "command" = "editor.action.referenceSearch.trigger";
      }
      {
        "key" = "R";
        "name" = "Search all references in side bar";
        "type" = "command";
        "command" = "references-view.find";
      }
    ];
  }
  {
    "key" = "t";
    "name" = "+Toggles";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "t";
        "name" = "Theme";
        "type" = "command";
        "command" = "workbench.action.selectTheme";
      }
      {
        "key" = "z";
        "name" = "Toggle [z]en mode";
        "type" = "command";
        "command" = "workbench.action.toggleZenMode";
      }
      {
        "key" = "s";
        "name" = "Toggle [s]ide Bar visibility";
        "type" = "command";
        "command" = "workbench.action.toggleSidebarVisibility";
      }
      {
        "key" = "a";
        "name" = "Toggle [a]ctivity Bar visibility";
        "type" = "command";
        "command" = "workbench.action.toggleActivityBarVisibility";
      }
      {
        "key" = "c";
        "name" = "Toggle find [c]ase sensitive";
        "type" = "command";
        "command" = "toggleFindCaseSensitive";
      }
    ];
  }
  {
    "key" = "v";
    "name" = "+VSCode";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "e";
        "name" = "Focus Active Editor Group";
        "type" = "command";
        "command" = "workbench.action.focusActiveEditorGroup";
      }
      {
        "key" = "r";
        "name" = "Move Side Bar Right";
        "type" = "command";
        "command" = "workbench.action.moveSideBarRight";
      }
      {
        "key" = "l";
        "name" = "Move Side Bar Left";
        "type" = "command";
        "command" = "workbench.action.moveSideBarLeft";
      }
    ];
  }
  {
    "key" = "r";
    "name" = "+Refactor";
    "type" = "bindings";
    "bindings" = [{
      "key" = "r";
      "name" = "Rename Symbol";
      "type" = "command";
      "command" = "editor.action.rename";
    }];
  }
  {
    "key" = "x";
    "name" = "+Text";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "i";
        "name" = "Organize Imports";
        "type" = "command";
        "command" = "editor.action.organizeImports";
      }
      {
        "key" = "r";
        "name" = "Rename symbol";
        "type" = "command";
        "command" = "editor.action.rename";
      }
      {
        "key" = "R";
        "name" = "Refactor";
        "type" = "command";
        "command" = "editor.action.refactor";
      }
      {
        "key" = ".";
        "name" = "Quick fix";
        "type" = "command";
        "command" = "editor.action.quickFix";
      }
      {
        "key" = "a";
        "name" = "Find all references";
        "type" = "command";
        "command" = "editor.action.referenceSearch.trigger";
      }
    ];
  }
  {
    "key" = "z";
    "name" = "Fold";
    "type" = "bindings";
    "bindings" = [
      {
        "key" = "a";
        "name" = "Toggle = around a point";
        "type" = "command";
        "command" = "editor.toggleFold";
      }
      {
        "key" = "c";
        "name" = "Close = at a point";
        "type" = "command";
        "command" = "editor.fold";
      }
      {
        "key" = "b";
        "name" = "Close = all block comments";
        "type" = "command";
        "command" = "editor.foldAllBlockComments";
      }
      {
        "key" = "g";
        "name" = "Close = all regions";
        "type" = "command";
        "command" = "editor.foldAllMarkerRegions";
      }
      {
        "key" = "m";
        "name" = "Close = all";
        "type" = "command";
        "command" = "editor.foldAll";
      }
      {
        "key" = "o";
        "name" = "Open = at a point";
        "type" = "command";
        "command" = "editor.unfold";
      }
      {
        "key" = "O";
        "name" = "Open = recursively";
        "type" = "command";
        "command" = "editor.unfoldRecursively";
      }
      {
        "key" = "G";
        "name" = "Open = all regions";
        "type" = "command";
        "command" = "editor.unfoldAllMarkerRegions";
      }
      {
        "key" = "r";
        "name" = "Open = all";
        "type" = "command";
        "command" = "editor.unfoldAll";
      }
    ];
  }
]

