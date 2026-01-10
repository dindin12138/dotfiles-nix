{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = false;
  };
  home.packages = with pkgs; [
    devenv
  ];
  home.file.".cargo/config.toml".text = ''
    [source.crates-io]
    replace-with = 'rsproxy-sparse'

    [source.rsproxy-sparse]
    registry = "sparse+https://rsproxy.cn/index/"

    [net]
    git-fetch-with-cli = true
  '';
}
