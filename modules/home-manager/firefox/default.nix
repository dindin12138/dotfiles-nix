{ pkgs, ... }:
let
  background = ../wall/wallpapers/background.png;
  homepage = builtins.toFile "homepage.html" (
    builtins.replaceStrings [ "(background.png)" ] [ "('file://${background}')" ] (
      builtins.readFile (
        pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/dindin12138/dotfiles-nix/dff50cfa58a104a8866d96293fd08dfbd7a8057e/modules/home-manager/firefox/homepage.html";
          sha256 = "sha256-pCC/IX+q10rHiQYUbFhxivyxloc8nuf5cN1465Dtv9o=";
        }
      )
    )
  );
in
{
  home = {
    sessionVariables = {
      BROWSER = "firefox";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
  programs.firefox = {
    enable = true;
    policies = {
      DisplayBookmarksToolbar = true;
      Preferences = {
        "browser.toolbars.bookmarks.visibility" = "never";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "media.ffmpeg.vaapi.enabled" = true;
      };
    };
    profiles.default = {
      settings = {
        "browser.startup.homepage" = "file://${homepage}";
      };
      userChrome = ''${builtins.readFile ./userChrome.css}'';
    };
  };
}
