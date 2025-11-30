{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ rmpc ];
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };
    extraConfig = ''
      auto_update "yes"
      restore_paused "yes"

      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }

      audio_output {
        type "fifo"
        name "Visualizer"
        format "44100:16:2"
        path "/tmp/mpd.fifo"
      }
    '';
  };
  services.mpdris2 = {
    enable = true;
    multimediaKeys = true;
    notifications = true;
  };
}
