{ inputs, config, ... }:
{
  nix-homebrew = {
    enable = true;
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
      "typora@free"
    ];
    # masApps = { wechat = ""; };
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
