{ config, ... }: {
  services.mako = with config.colorScheme.palette; {
    enable = true;
    actions = true;
    font = "FiraCode Nerd Font 11";
    icons = true;
    anchor = "top-right";
    defaultTimeout = 5000;
    ignoreTimeout = false;
    layer = "overlay";
    markup = true;
    sort = "-time";
    textColor = "#${base05}";
    backgroundColor = "#${base00}";
    borderColor = "#${base04}";
    progressColor = "over #${base04}";
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
      border-color=#${base04}
      default-timeout=2000
      [urgency=normal]
      border-color=#${base04}
      default-timeout=5000
      [urgency=high]
      border-color=#${base08}
      text-color=#${base08}
      default-timeout=0
      [category=mpd]
      border-color=#${base04}
      default-timeout=2000
      group-by=category
    '';
  };
}

