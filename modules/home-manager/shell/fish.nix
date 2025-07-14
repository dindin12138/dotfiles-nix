{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      "..." = "cd ../..";

      ls = "exa";
      la = "exa -lha --group-directories-first --git";
      ll = "exa -lh --group-directories-first --git";
      lt = "exa -T --git-ignore --level=2 --group-directories-first";

      t = "tmux attach";
      ta = "tmux attach -t";
      tn = "tmux new-session";
      tl = "tmux list-sessions";
      tk = "tmux kill-session -t";

      ra = "y";
      nf = "fastfetch";

      cat = "bat";
      icat = "kitty +kitten icat";
      lg = "lazygit";

      duf = "nix run nixpkgs#duf";
      dust = "nix run nixpkgs#dust";

      fc = "cliphist list | fzf | cliphist decode | wl-copy";

      camera = "mpv --profile=low-latency --untimed /dev/video0";

      kbd-backlight-off =
        "${pkgs.brightnessctl}/bin/brightnessctl -sd platform::kbd_backlight set 0"; # turn off keyboard backlight.
      kbd-backlight-on =
        "${pkgs.brightnessctl}/bin/brightnessctl -rd platform::kbd_backlight"; # turn on keyboard backlight.

      vscode-neovim = "NVIM_APPNAME=vscode-neovim nvim";

      code-cpp = "code --profile CPP";
      code-rust = "code --profile Rust";
      code-go = "code --profile Go";
      code-python = "code --profile Python";
      code-remote = "code --profile Remote";
      code-markdown = "code --profile Markdown";
      code-neovim = "code --profile Neovim";

      proxy-test = "curl -I http://www.google.com";

      nix-profile-history =
        "nix profile history --profile /nix/var/nix/profiles/system";
      nix-query =
        "nix-store --gc --print-roots | rg -v '/proc/' | rg -Po '(?<= -> ).*' | xargs -o ${pkgs.nix-tree}/bin/nix-tree";
    };
    functions = {
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        	builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
    plugins = [ ];
    interactiveShellInit = ''
      set -U fish_greeting ""
    '';
  };
}
