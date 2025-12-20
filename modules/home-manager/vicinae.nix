{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];
  stylix.targets.vicinae.enable = true;
  services.vicinae = {
    enable = true;
    package = pkgs.vicinae;
    autoStart = true;
    useLayerShell = false;
    extensions = [ ];
    settings = {
      font = {
        name = config.stylix.fonts.monospace.name;
        size = config.stylix.fonts.sizes.applications - 1;
      };
      popToRootOnClose = true;
      window = {
        csd = true;
      };
      rootSearch = {
        searchFiles = false;
      };
    };
  };
}
