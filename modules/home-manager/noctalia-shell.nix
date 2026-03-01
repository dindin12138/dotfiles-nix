{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  # stylix.targets.noctalia-shell.enable = true;
  programs.noctalia-shell = {
    enable = true;
    # systemd.enable = true;
  };
}
