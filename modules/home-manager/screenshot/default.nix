{ pkgs, ... }:
{
  home.packages = with pkgs; [
    slurp
    grim
    jq
    libnotify
    satty
    (pkgs.writeShellScriptBin "grimblast" ''${builtins.readFile ./grimblast}'')
  ];
}

