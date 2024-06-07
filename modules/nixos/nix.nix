{
  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
    };
  };
}
