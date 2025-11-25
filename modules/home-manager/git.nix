{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "dindin12138";
        email = "79844759+dindin12138@users.noreply.github.com";
      };
    };
  };

  home.packages = with pkgs; [
    lazygit
  ];
}
