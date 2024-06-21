{ pkgs, ... }:
let
  scripts = import ./preview_file.nix { inherit pkgs; };
in
{
  programs.joshuto = {
    enable = true;
    # keymap = { };
    # mimetype = { };
    settings = {
      numbered_command = false;

      mouse_support = true;
      focus_on_create = true;
      use_trash = true;
      watch_files = true;
      xdg_open = false;
      xdg_open_fork = false;
      case_insensitive_ext = false;
      zoxide_update = false;

      custom_commands = [ ];

      display = {
        # default, hsplit
        mode = "default";

        automatically_count_files = false;
        collapse_preview = true;
        # ratios for parent view (optional), current view and preview
        column_ratio = [ 1 2 4 ];
        scroll_offset = 6;
        show_borders = false;
        show_hidden = false;
        show_icons = true;
        # none, absolute, relative
        line_number_style = "none";

        # size, mtime, user, gourp, perm. can be combined with |.
        # `none` to disable, `all` to enable all
        # all and none can't be combined with other options
        linemode = "size";
      };

      display.sort = {
        # lexical, mtime, natural, size, ext
        sort_method = "natural";
        case_sensitive = false;
        directories_first = true;
        reverse = false;
      };

      preview = {
        max_preview_size = 10737418240; # 10GB
        preview_script = "${scripts.preview_file}/bin/preview_file"; # make sure it's marked as executable
      };

      search = {
        # insensitive, sensitive, smart
        string_case_sensitivity = "insensitive";
        # see above
        glob_case_sensitivity = "sensitive";
        # see above
        regex_case_sensitivity = "sensitive";
        # see above
        fzf_case_sensitivity = "insensitive";
      };

      tab = {
        # inherit, home, root
        home_page = "home";
      };
    };
    # theme = { };
  };

  home.file = {
    ".config/joshuto/bookmarks.toml".source = ./bookmarks.toml;
    ".config/joshuto/icons.toml".source = ./icons.toml;
    ".config/joshuto/keymap.toml".source = ./keymap.toml;
    ".config/joshuto/mimetype.toml".source = ./mimetype.toml;
    ".config/joshuto/theme.toml".source = ./theme.toml;
  };
}
