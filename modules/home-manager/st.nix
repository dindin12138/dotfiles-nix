{
  inputs,
  pkgs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
  st = inputs.st.packages.${system}.default;
in
{
  home.packages = [ st ];
}
