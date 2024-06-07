{
  systemd.services.nix-daemon.environment = {
    http_proxy = "http://192.168.0.106:7890";
    https_proxy = "http://192.168.0.106:7890";
  };
}
