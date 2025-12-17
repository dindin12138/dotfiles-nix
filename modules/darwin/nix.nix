{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      # auto-optimise-store = true;
      substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    };
    gc = {
      automatic = true;
      interval.Weekday = 7;
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    hostPlatform = "aarch64-darwin";
  };
  launchd.daemons.nix-daemon.serviceConfig = {
    EnvironmentVariables = {
      http_proxy = "http://127.0.0.1:7897";
      https_proxy = "http://127.0.0.1:7897";
      all_proxy = "http://127.0.0.1:7897";
    };
  };
}
