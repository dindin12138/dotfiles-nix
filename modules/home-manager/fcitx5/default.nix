{ pkgs, ... }:
{
  stylix.targets.fcitx5.enable = true;
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
    ];
  };
  home.file = {
    ".local/share/fcitx5/themes/Nord/theme.conf".text = import ./theme.nix;
  };
}
