{ config, ... }:
{
  # stylix.targets.vicinae.enable = true;
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    extensions = [ ];
    useLayerShell = false;
    settings = {
      font = {
        normal = config.stylix.fonts.monospace.name;
        size = config.stylix.fonts.sizes.applications - 1;
      };
      popToRootOnClose = true;
      rootSearch = {
        searchFiles = false;
      };
      window = {
        csd = true;
      };
    };
  };
}
