{ pkgs, ... }:
{
  programs.joshuto = {
    enable = true;
  };
  home.file = {
    ".config/joshuto/bookmarks.toml".source = ./bookmarks.toml;
    ".config/joshuto/icons.toml".source = ./icons.toml;
    ".config/joshuto/joshuto.toml".source = ./joshuto.toml;
    ".config/joshuto/keymap.toml".source = ./keymap.toml;
    ".config/joshuto/mimetype.toml".source = ./mimetype.toml;
    ".config/joshuto/theme.toml".source = ./theme.toml;
    ".config/joshuto/on_preview_shown.sh".source = ./on_preview_shown.sh;
    ".config/joshuto/on_preview_removed.sh".source = ./on_preview_removed.sh;
    ".config/joshuto/preview_file.sh".source = ./preview_file.sh;
  };
  home.packages = with pkgs; [
    file
    swappy
    atool
    unrar
    p7zip
    w3m
    mediainfo
    exiftool
  ];
}
