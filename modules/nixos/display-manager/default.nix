{ pkgs
, config
, lib
, ...
}: {
  # sddm
  services.displayManager.sddm = {
    # enable sddm
    enable = true;

    # enable experimental wayland support
    wayland.enable = true;

    # theme
    theme = "${import ./catppuccin.nix { inherit pkgs; }}";
  };
}
