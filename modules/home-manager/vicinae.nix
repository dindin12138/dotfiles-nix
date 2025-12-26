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
    systemd = {
      enable = true;
      autoStart = true;
    };
    extensions = [ ];
    settings = {
      font = {
        normal = config.stylix.fonts.monospace.name;
        size = config.stylix.fonts.sizes.applications - 1;
      };
      pop_to_root_on_close = true;
      search_files_in_root = false;
      # window = {
      #   csd = true;
      # };
    };
  };
}
