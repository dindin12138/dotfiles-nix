{ pkgs, ... }:
{
  stylix.targets.fcitx5.enable = true;
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        (fcitx5-rime.override {
          rimeDataPkgs = [
            pkgs.rime-ice
          ];
        })
      ];
      settings = {
        inputMethod = {
          "Groups/0" = {
            "Name" = "Default";
            "Default Layout" = "us";
            "DefaultIM" = "rime";
          };
          "Groups/0/Items/0" = {
            "Name" = "keyboard-us";
          };
          "Groups/0/Items/1" = {
            "Name" = "rime";
          };
          "GroupOrder" = {
            "0" = "Default";
          };
        };
      };
    };
  };
  xdg.dataFile."fcitx5/rime/default.custom.yaml".text = ''
    patch:
      __include: rime_ice_suggestion:/

      schema_list:
        - schema: rime_ice
  '';
}
