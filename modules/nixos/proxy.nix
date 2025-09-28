{
  systemd.services.nix-daemon.environment = {
    # http_proxy = "http://127.0.0.1:7897";
    # https_proxy = "http://127.0.0.1:7897";
    http_proxy = "http://192.168.0.105:7897";
    https_proxy = "http://192.168.0.105:7897";
  };
}
