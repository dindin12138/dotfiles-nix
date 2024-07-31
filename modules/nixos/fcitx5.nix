{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      ignoreUserConfig = true;
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-chinese-addons
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
}
