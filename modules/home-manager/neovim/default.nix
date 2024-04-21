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
      # Formatter
      stylua
      nixpkgs-fmt
      # Tools
      gnumake
      fd
      ripgrep
    ];
  };

  home.file.".config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };
}
