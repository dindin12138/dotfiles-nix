{
  programs.qutebrowser = {
    enable = true;
    settings = {
      tabs.show = "never";
      statusbar.show = "never";
      fonts = {
        default_family = "FiraCode Nerd Font";
        default_size = "13pt";
      };
      colors.webpage.darkmode.enabled = true;
      downloads = {
        position = "bottom";
        remove_finished = 3;
      };
      editor.command =
        [ "kitty" "--class" "float-kitty" "-e" "nvim" "+{line}" "{file}" ];
      fileselect = {
        handler = "external";
        single_file.command =
          [ "kitty" "--class" "float-kitty" "-e" "yazi" "--chooser-file" "{}" ];
        multiple_files.command =
          [ "kitty" "--class" "float-kitty" "-e" "yazi" "--chooser-file" "{}" ];
        folder.command =
          [ "kitty" "--class" "float-kitty" "-e" "yazi" "--chooser-file" "{}" ];
      };
    };
    extraConfig = ''
      import os
      from urllib.request import urlopen

      # load your autoconfig, use this, if the rest of your config is empty!
      config.load_autoconfig()

      if not os.path.exists(config.configdir / "theme.py"):
          theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
          with urlopen(theme) as themehtml:
              with open(config.configdir / "theme.py", "a") as file:
                  file.writelines(themehtml.read().decode("utf-8"))

      if os.path.exists(config.configdir / "theme.py"):
          import theme

          theme.setup(c, "mocha", True)
    '';
    keyBindings = {
      normal = {
        "<Ctrl-m>" = "hint links spawn --detach mpv {hint-url}";
        "<Ctrl-p>" = "hint images download";
        "<Ctrl-d>" =
          "hint links spawn  kitty --class 'float-kitty' -e yt-dlp {hint-url}";
      };
      command = {
        "<Ctrl-j>" = "completion-item-focus next";
        "<Ctrl-k>" = "completion-item-focus prev";
      };
    };
    searchEngines = {
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      # nw = "https://wiki.nixos.org/index.php?search={}";
      np =
        "https://search.nixos.org/packages?channel=unstable&sort=relevance&query={}";
      no =
        "https://search.nixos.org/options?channel=unstable&sort=relevance&query={}";
      g = "https://www.google.com/search?hl=en&q={}";
      bl = "https://search.bilibili.com/all?keyword={}";
      yt = "https://www.youtube.com/results?search_query={}";
    };
  };
}
