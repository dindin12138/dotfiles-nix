{ pkgs, ... }:
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

      t = "tmux attach";
      ta = "tmux attach -t";
      tn = "tmux new-session";
      tl = "tmux list-sessions";

      ra = "yazi";
      nf = "fastfetch";

      cat = "bat";
      icat = "kitty +kitten icat";
      lg = "lazygit";

      duf = "nix run nixpkgs#duf";
      dust = "nix run nixpkgs#dust";

      fc = "cliphist list | fzf | cliphist decode | wl-copy";

      camera = "mpv --profile=low-latency --untimed /dev/video0";

      kbd-backlight-off = "${pkgs.brightnessctl}/bin/brightnessctl -sd platform::kbd_backlight set 0"; # turn off keyboard backlight.
      kbd-backlight-on = "${pkgs.brightnessctl}/bin/brightnessctl -rd platform::kbd_backlight"; # turn on keyboard backlight.

      vscode-neovim = "NVIM_APPNAME=vscode-neovim nvim";

      proxy-test = "curl -I http://www.google.com";

      nix-profile-history = "nix profile history --profile /nix/var/nix/profiles/system";
      nix-query = "nix-store --gc --print-roots | rg -v '/proc/' | rg -Po '(?<= -> ).*' | xargs -o ${pkgs.nix-tree}/bin/nix-tree";
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
