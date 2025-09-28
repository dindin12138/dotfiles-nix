{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    # proxy.default = "http://127.0.0.1:7897";
    proxy.default = "http://192.168.0.105:7897";
  };
}
