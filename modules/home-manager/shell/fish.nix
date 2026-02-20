{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      "..." = "cd ../..";

      c = "clear";
      cl = "clear";

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
      nf = "${pkgs.fastfetch}/bin/fastfetch";

      cat = "bat";
      lg = "lazygit";
      # ld = "lazydocker";

      duf = "nix run nixpkgs#duf";
      dust = "nix run nixpkgs#dust";
      telegram = "nix run nixpkgs#telegram-desktop";

      # fc = "cliphist list | fzf | cliphist decode | wl-copy";

      camera = "mpv --profile=low-latency --untimed /dev/video0";

      yt-dlp-best = "yt-dlp -f 'bestvideo+bestaudio/best'";

      # vscode-neovim = "NVIM_APPNAME=vscode-neovim nvim";

      code-cpp = "code --profile CPP";
      code-rust = "code --profile Rust";
      code-go = "code --profile Go";
      code-python = "code --profile Python";
      code-remote = "code --profile Remote";
      code-markdown = "code --profile Markdown";
      # code-neovim = "code --profile Neovim";

      proxy-test = "curl -I http://www.google.com";

      nix-profile-history = "nix profile history --profile /nix/var/nix/profiles/system";
      nix-query = "nix-store --gc --print-roots | rg -v '/proc/' | rg -Po '(?<= -> ).*' | xargs -o ${pkgs.nix-tree}/bin/nix-tree";
    };
    functions = {
      proxy-on = ''
        set -gx http_proxy "http://127.0.0.1:7897"
        set -gx https_proxy "http://127.0.0.1:7897"
        set -gx all_proxy "http://127.0.0.1:7897"
        echo "✅ HTTP Proxy has been set for Fish shell."
      '';
      proxy-off = ''
        set -e http_proxy
        set -e https_proxy
        set -e all_proxy
        echo "❌ HTTP Proxy has been unset for Fish shell."
      '';
      nix-fzf-search = ''
        function nix-fzf-search
          set q $argv
          nix search nixpkgs $q --json 2>/dev/null \
          | ${pkgs.jq}/bin/jq -r '
              to_entries[]
              | .key as $k
              | ($k | split(".")[-1]) as $pkg
              | "\($k)\t\($pkg)\t\(.value.version // "-")\t\(.value.description // "")"
            ' \
          | fzf --prompt=" Nixpkgs 󰄾 " \
                --delimiter="\t" \
                --with-nth=2 \
                --preview 'printf "attr: %s\nversion: %s\n\n%s\n" {1} {3} {4}' \
          | cut -f1
        end
      '';
    };
    plugins = [ ];
    interactiveShellInit = ''
      set -U fish_greeting ""
    '';
  };
}
