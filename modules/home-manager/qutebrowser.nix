{
  stylix.targets.qutebrowser.enable = true;
  programs.qutebrowser = {
    enable = true;
    settings = {
      tabs.show = "never";
      statusbar.show = "never";
      colors.webpage.darkmode.enabled = true;
      scrolling.smooth = true;
      downloads = {
        position = "bottom";
        remove_finished = 3;
      };
      url = {
        default_page = "https://www.google.com/";
        start_pages = "https://www.google.com/";
        # searchengines = { DEFAULT = "https://www.google.com/search?q={}"; };
      };
      editor.command = [
        "foot"
        "--app-id"
        "float-term"
        "-e"
        "nvim"
        "+{line}"
        "{file}"
      ];
      fileselect = {
        handler = "external";
        single_file.command = [
          "foot"
          "--app-id"
          "float-term"
          "-e"
          "yazi"
          "--chooser-file"
          "{}"
        ];
        multiple_files.command = [
          "foot"
          "--app-id"
          "float-term"
          "-e"
          "yazi"
          "--chooser-file"
          "{}"
        ];
        folder.command = [
          "foot"
          "--app-id"
          "float-term"
          "-e"
          "yazi"
          "--chooser-file"
          "{}"
        ];
      };
    };
    keyBindings = {
      normal = {
        "<Ctrl-m>" = "hint links spawn --detach mpv {hint-url}";
        "<Ctrl-p>" = "hint images download";
        "<Ctrl-d>" = "hint links spawn  kitty --class 'float-kitty' -e yt-dlp {hint-url}";
      };
      command = {
        "<Ctrl-j>" = "completion-item-focus next";
        "<Ctrl-k>" = "completion-item-focus prev";
      };
    };
    searchEngines = {
      DEFAULT = "https://www.google.com/search?q={}";
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      # nw = "https://wiki.nixos.org/index.php?search={}";
      np = "https://search.nixos.org/packages?channel=unstable&sort=relevance&query={}";
      no = "https://search.nixos.org/options?channel=unstable&sort=relevance&query={}";
      bl = "https://search.bilibili.com/all?keyword={}";
      yt = "https://www.youtube.com/results?search_query={}";
    };
  };
}
