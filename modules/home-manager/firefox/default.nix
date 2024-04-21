{ pkgs, ... }:
let
  background = ./background.png;
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
      userChrome = ''
        /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/autohide_toolbox.css made available under Mozilla Public License v. 2.0
        See the above repository for updates as well as full license text. */

        /* Hide the whole toolbar area unless urlbar is focused or cursor is over the toolbar */
        /* Dimensions on non-Win10 OS probably needs to be adjusted */

        /* Compatibility options for hide_tabs_toolbar.css and tabs_on_bottom.css at the end of this file */

        :root{
          --uc-autohide-toolbox-delay: 200ms; /* Wait 0.1s before hiding toolbars */
          --uc-toolbox-rotation: 82deg;  /* This may need to be lower on mac - like 75 or so */
        }

        :root[sizemode="maximized"]{
          --uc-toolbox-rotation: 88.5deg;
        }

        @media  (-moz-platform: windows){
          :root:not([lwtheme]) #navigator-toolbox{ background-color: -moz-dialog !important; }
        }

        :root[sizemode="fullscreen"],
        #navigator-toolbox[inFullscreen]{ margin-top: 0 !important; }

        #navigator-toolbox{
          position: fixed !important;
          display: block;
          background-color: var(--lwt-accent-color,black) !important;
          transition: transform 82ms linear, opacity 82ms linear !important;
          transition-delay: var(--uc-autohide-toolbox-delay) !important;
          transform-origin: top;
          transform: rotateX(var(--uc-toolbox-rotation));
          opacity: 0;
          line-height: 0;
          z-index: 1;
          pointer-events: none;
        }

        #navigator-toolbox:hover,
        #navigator-toolbox:focus-within{
          transition-delay: 33ms !important;
          transform: rotateX(0);
          opacity: 1;
        }
        /* This ruleset is separate, because not having :has support breaks other selectors as well */
        #mainPopupSet:has(> #appMenu-popup:hover) ~ toolbox{
          transition-delay: 33ms !important;
          transform: rotateX(0);
          opacity: 1;
        }

        #navigator-toolbox > *{ line-height: normal; pointer-events: auto }

        #navigator-toolbox,
        #navigator-toolbox > *{
          width: 100vw;
          -moz-appearance: none !important;
        }

        /* These two exist for oneliner compatibility */
        #nav-bar{ width: var(--uc-navigationbar-width,100vw) }
        #TabsToolbar{ width: calc(100vw - var(--uc-navigationbar-width,0px)) }

        /* Don't apply transform before window has been fully created */
        :root:not([sessionrestored]) #navigator-toolbox{ transform:none !important }

        :root[customizing] #navigator-toolbox{
          position: relative !important;
          transform: none !important;
          opacity: 1 !important;
        }

        #navigator-toolbox[inFullscreen] > #PersonalToolbar,
        #PersonalToolbar[collapsed="true"]{ display: none }

        /* Uncomment this if tabs toolbar is hidden with hide_tabs_toolbar.css */
         /*#titlebar{ margin-bottom: -9px }*/

        /* Uncomment the following for compatibility with tabs_on_bottom.css - this isn't well tested though */
        /*
        #navigator-toolbox{ flex-direction: column; display: flex; }
        #titlebar{ order: 2 }
        */
      '';
    };
  };
}
