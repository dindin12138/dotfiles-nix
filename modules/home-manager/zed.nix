{
  pkgs,
  config,
  lib,
  ...
}:
{
  stylix.targets.zed.enable = true;
  programs.zed-editor = {
    enable = true;
    extensions = [
      "material-icon-theme"
      "nix"
    ];
    extraPackages = with pkgs; [
      nixd
      nil
      clang-tools
    ];
    mutableUserSettings = true;
    userSettings = {
      ui_font_size = lib.mkForce (config.stylix.fonts.sizes.applications + 6);
      buffer_font_size = lib.mkForce (config.stylix.fonts.sizes.terminal + 2);
      agent_servers = {
        gemini = {
          ignore_system_version = false;
        };
      };
    };
  };
}
