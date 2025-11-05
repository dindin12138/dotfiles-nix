{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    source-han-sans
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.fira-code
  ];
}
