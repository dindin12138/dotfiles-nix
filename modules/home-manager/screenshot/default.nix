{ pkgs, ... }: {
  home.packages = with pkgs; [
    slurp
    grim
    jq
    libnotify
    imv
    satty
    (pkgs.writeShellScriptBin "grimblast" "${builtins.readFile ./grimblast}")
  ];
}

