{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    daemon.enable = true;
    forceOverwriteSettings = true;
    flags = [ "--disable-up-arrow" ];
    settings = {
      auto_sync = false;
      sync_frequency = "10m";
      sync_address = "https://api.atuin.sh";
      search_mode = "fuzzy";
      filter_mode = "global";
      style = "full";
      inline_height = 20;
      show_preview = true;
      enter_accept = false;
      history_filter = [
        "^Secret"
        "^base64"
      ];
      secrets_filter = true;
    };
  };
}
