{ pkgs, ... }:
# let
#   catppuccin_mocha = pkgs.fetchFromGitHub {
#     owner = "catppuccin";
#     repo = "btop";
#     rev = "89ff712eb62747491a76a7902c475007244ff202";
#     sha256 = "sha256-J3UezOQMDdxpflGax0rGBF/XMiKqdqZXuX4KMVGTxFk=";
#   };
# in
{
  programs.btop = {
    enable = true;
    catppuccin.enable = true;
    # settings = {
    #   color_theme = "catppuccin_mocha";
    # };
  };
  # home.file = {
  #   ".config/btop/themes/catppuccin_mocha.theme".source = pkgs.fetchurl {
  #     url = "file://${catppuccin_mocha}/themes/catppuccin_mocha.theme";
  #     sha256 = "sha256-TeaxAadm04h4c55aXYUdzHtFc7pb12e0wQmCjSymuug=";
  #   };
  # };
}
