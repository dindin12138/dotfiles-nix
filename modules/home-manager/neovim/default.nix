{ pkgs, ... }: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraPackages = with pkgs; [
      # LSP
      lua-language-server
      nixd
      clang-tools
      pyright
      rust-analyzer
      neocmakelsp
      gopls
      ruff
      sqls
      bash-language-server

      # Formatter
      stylua
      nixfmt-classic
      nodePackages.prettier
      shfmt
      beautysh
      gofumpt
      jq

      # Tools
      gnumake
      cmake
    ];
  };

  home.file = {
    ".config/nvim/" = {
      source = ./nvim;
      recursive = true;
    };
    ".config/vscode-neovim/" = {
      source = ./vscode-neovim;
      recursive = true;
    };
  };
}
