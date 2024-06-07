{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    # source-han-sans
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code-nerdfont
  ];
}
