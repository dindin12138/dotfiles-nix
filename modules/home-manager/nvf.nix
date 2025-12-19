{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  nvf = inputs.nvf.packages.${system}.default;
in
{
  home.packages = [ nvf ];
}
