{ pkgs, ... }:
{
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
      # nixfmt-classic
      nixfmt
      # nodePackages.prettier
      prettier
      shfmt
      beautysh
      gofumpt
      jq
      cmake-format

      # Tools
      gnumake
      cmake
    ];
  };
}
