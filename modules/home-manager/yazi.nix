{
  stylix.targets.yazi.enable = true;
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    keymap = { };
    settings = {
      mgr = {
        ratio = [
          1
          2
          4
        ];
        sort_by = "natural";
      };
      preview = {
        max_width = 1800;
        max_height = 1800;
      };
    };
    theme = {
      mgr = {
        hovered = {
          reversed = true;
        };
        preview_hovered = {
          reversed = true;
        };
        border_symbol = " ";
      };
      icon = {
        dirs = [
          {
            name = "Desktop";
            text = "";
          }
          {
            name = "Development";
            text = "";
          }
          {
            name = "Documents";
            text = "";
          }
          {
            name = "Downloads";
            text = "";
          }
          {
            name = "Library";
            text = "";
          }
          {
            name = "Movies";
            text = "";
          }
          {
            name = "Music";
            text = "";
          }
          {
            name = "Pictures";
            text = "";
          }
          {
            name = "Public";
            text = "";
          }
          {
            name = "Videos";
            text = "";
          }
          {
            name = "Workspace";
            text = "";
          }
          {
            name = "Zotero";
            text = "󰰶";
          }
          {
            name = "Templates";
            text = "";
          }
          {
            name = "Screenshots";
            text = "󰸉";
          }
          {
            name = "Wallpapers";
            text = "󰸉";
          }
          {
            name = "Larian Studios";
            text = "󱎓";
          }
          {
            name = "VM";
            text = "";
          }
          {
            name = "ISO";
            text = "";
          }
          {
            name = "InfiniCloud";
            text = "󰘿";
          }
        ];
      };
    };
  };
}
