{
  inputs,
  pkgs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
  nixvim = inputs.nixvim.packages.${system}.default;
in
{
  home.sessionVariables.EDITOR = "nvim";
  home.packages = [ nixvim ];
}
