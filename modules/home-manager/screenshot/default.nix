{ pkgs, ... }:
{
  home.packages = with pkgs; [
    slurp
    grim
    jq
    libnotify
    (pkgs.writeShellScriptBin "grimblast" ''${builtins.readFile ./grimblast}'')
    satty
  ];
}

