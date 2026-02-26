{ lib, inputs, ... }:
{
  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
      trusted-users = [
        "root"
        "din"
      ];
    };
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
      (lib.filterAttrs (_: lib.isType "flake")) inputs
    );
    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
