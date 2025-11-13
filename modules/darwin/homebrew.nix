{ inputs, config, ... }:
{
  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    # enableRosetta = true;

    # User owning the Homebrew prefix
    user = "din";

    taps = {
      "dindin12138/homebrew-din" = inputs.homebrew-din;
    };
  };

  homebrew = {
    enable = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    casks = [
      "obsidian"
      "godot"
      "vlc"
      "zen"
      # custom pkg
      "typora@free"
    ];
    # masApps = {
    # wechat = "";
    # };
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
