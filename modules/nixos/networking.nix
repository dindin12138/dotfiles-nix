{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    proxy.default = "http://192.168.0.106:7890";
  };
}
