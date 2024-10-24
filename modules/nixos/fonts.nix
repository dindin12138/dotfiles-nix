{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    source-han-sans
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code-nerdfont
  ];
}
