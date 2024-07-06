{ config, ... }:
{

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };
    extraConfig = ''
      auto_update "yes"

      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
