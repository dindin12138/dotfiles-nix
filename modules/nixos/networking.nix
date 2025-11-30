{
  networking = {
    hostName = "nixos-tb";
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.iwd = {
      enable = true;
      settings = {
        Settings = {
          AutoConnect = true;
        };
      };
    };
    proxy.default = "http://127.0.0.1:7897";
  };
}
