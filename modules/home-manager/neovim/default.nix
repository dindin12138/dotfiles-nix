{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    extraPackages = with pkgs; [
      # LSP
      lua-language-server
      nil
      clang-tools
      pyright
      rust-analyzer
      neocmakelsp
      gopls
      ruff-lsp
      sqls
      # Formatter
      stylua
      nixpkgs-fmt
      nodePackages.prettier
      shfmt
      beautysh
      gofumpt
      jq
      # Tools
      gnumake
    ];
  };

  home.file = {
    ".config/nvim/" = {
      source = ./nvim;
      recursive = true;
    };
    # ".config/astronvim/" = {
    #   source = ./astronvim;
    #   recursive = true;
    # };
  };
}
