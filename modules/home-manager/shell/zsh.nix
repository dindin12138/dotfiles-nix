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

      t = "tmux attach || tmux new-session";
      ta = "tmux attach -t";
      tn = "tmux new-session";
      tl = "tmux list-sessions";

      ra = "yazi";
      nf = "fastfetch";

      cat = "bat";
      icat = "kitty +kitten icat";
      lg = "lazygit";

      fc = "cliphist list | fzf | cliphist decode | wl-copy";
    };
    initExtra = ''

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      function joshuto() {
      	ID="''$$"
      	mkdir -p /tmp/$USER
      	OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
      	env joshuto --output-file "$OUTPUT_FILE" $@
      	exit_code=$?

      	case "$exit_code" in
      		# regular exit
      		0)
      			;;
      		# output contains current directory
      		101)
      			JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
      			cd "$JOSHUTO_CWD"
      			;;
      		# output selected files
      		102)
      			;;
      		*)
      			echo "Exit code: $exit_code"
      			;;
      	esac
      }
    '';
  };
}
