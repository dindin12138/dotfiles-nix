{
  imports = [
    ./swww.nix
  ];

  home.file = {
    "Pictures/Wallpapers/" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
