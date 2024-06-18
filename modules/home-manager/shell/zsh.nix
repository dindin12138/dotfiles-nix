{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "exa";
      la = "exa -lha --group-directories-first --git";
      ll = "exa -lh --group-directories-first --git";
      lt = "exa -T --git-ignore --level=2 --group-directories-first";

      ra = "yazi";
      nf = "fastfetch";

      cat = "bat";
      icat = "kitty +kitten icat";
      lg = "lazygit";

      fc = "cliphist list | fzf | cliphist decode | wl-copy";
    };
  };
}
