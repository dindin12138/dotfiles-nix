{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -f /opt/ros/jazzy/setup.bash ]; then
        source /opt/ros/jazzy/setup.bash
      fi

      if [[ $- == *i* ]]; then
        if [ -x "$HOME/.nix-profile/bin/fish" ]; then
          exec "$HOME/.nix-profile/bin/fish"
        fi
      fi
    '';
  };
}
