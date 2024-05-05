{
  services.mako = {
    enable = true;
    actions = true;
    font = "FiraCode Nerd Font 10";
    icons = true;
    anchor = "top-right";
    defaultTimeout = 5000;
    ignoreTimeout = false;
    layer = "overlay";
    markup = true;
    sort = "-time";
    textColor = "#d9e0ee";
    backgroundColor = "#1e1e2e";
    borderColor = "#6C7086";
    progressColor = "over #6C7086";
    borderRadius = 4;
    borderSize = 2;
    width = 300;
    height = 100;
    margin = "10";
    maxIconSize = 64;
    maxVisible = 5;
    padding = "15";
    extraConfig = ''
      on-button-left=dismiss
      on-button-middle=none
      on-button-right=dismiss-all
      on-touch=dismiss
      [urgency=low]
      border-color=#6C7086
      default-timeout=2000
      [urgency=normal]
      border-color=#6C7086
      default-timeout=5000
      [urgency=high]
      border-color=#f38ba8
      text-color=#f38ba8
      default-timeout=0
      [category=mpd]
      border-color=#6C7086
      default-timeout=2000
      group-by=category
    '';
  };
}

