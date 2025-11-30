{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 3";
    };
    flake = "/home/din/Workspace/dotfiles-nix"; # sets NH_OS_FLAKE variable for you
  };
}
