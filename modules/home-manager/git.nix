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

  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      git = {
        pagers = [
          {
            colorArg = "always";
            pager = "delta --dark --paging=never";
          }
        ];
      };
      gui = {
        nerdFontsVersion = "3";
        mouseEvents = true;
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      # side-by-side = true;
      line-numbers = true;
      navigate = true;
      decorations = {
        commit-decoration-style = "bold yellow box ul";
        file-style = "bold yellow ul";
        file-decoration-style = "none";
        hunk-header-decoration-style = "cyan box ul";
      };
      true-color = "always";
    };
  };
}
