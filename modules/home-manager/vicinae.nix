{
  stylix.targets.vicinae.enable = true;
  programs.vicinae = {
    enable = true;
    useLayerShell = true;
    extensions = [ ];
    settings = {
      popToRootOnClose = true;
      window = {
        csd = true;
      };
      rootSearch = {
        searchFiles = false;
      };
    };
    systemd = {
      enable = true;
      autoStart = true;
    };
  };
}
