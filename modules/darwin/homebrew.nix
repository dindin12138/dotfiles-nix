{ inputs, ... }:
{
  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    # enableRosetta = true;

    # User owning the Homebrew prefix
    user = "din";
  };

  homebrew = {
    enable = true;
    casks = [
      "obsidian"
      "godot"
      # "typora"
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
  environment = {
    variables = {
      HOMEBREW_API_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api";
      HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles";
      HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git";
      HOMEBREW_CORE_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git";
    };
  };
}
