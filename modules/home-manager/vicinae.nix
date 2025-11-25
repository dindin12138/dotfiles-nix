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
        blur = false;
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
