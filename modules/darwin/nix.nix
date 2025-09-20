{
  # Necessary for using flakes on this system.
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      # auto-optimise-store = true;
      substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    };
  };

  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
    # The platform the configuration will be used on.
    hostPlatform = "aarch64-darwin";
  };
}
