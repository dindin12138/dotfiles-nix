{
  networking.proxy.default = "http://127.0.0.1:7897";
  systemd.services.nix-daemon.environment = {
    http_proxy = "http://127.0.0.1:7897";
    https_proxy = "http://127.0.0.1:7897";
  };
}
