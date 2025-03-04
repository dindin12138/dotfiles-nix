{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles = { default = import ./default/profile.nix { inherit pkgs; }; };
  };
}
