{ pkgs, ... }:
let
  mygrimblast = pkgs.grimblast.overrideAttrs (oldAttrs: {
    src = ./grimblast;
  });
in
{
  home.packages = with pkgs; [
    mygrimblast
  ];
}

