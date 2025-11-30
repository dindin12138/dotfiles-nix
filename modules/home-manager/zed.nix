{
  pkgs,
  config,
  lib,
  ...
}:
let
  isLinux = pkgs.stdenv.isLinux;
in
{
  stylix.targets.zed.enable = true;
  programs.zed-editor = {
    enable = true;
    extensions = [
      "material-icon-theme"
      "nix"
      "toml"
    ];
    extraPackages = with pkgs; [
      nixd
      nil
      clang-tools
      ruff
      rust-analyzer
      gopls
    ];
    mutableUserSettings = true;
    userSettings = {
      ui_font_size = lib.mkForce (config.stylix.fonts.sizes.applications + (if isLinux then 6 else 0));
      buffer_font_size = lib.mkForce (config.stylix.fonts.sizes.terminal + (if isLinux then 2 else 0));
      agent_servers = {
        gemini = {
          ignore_system_version = false;
        };
      };
    };
  };
}
