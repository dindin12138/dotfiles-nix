{ pkgs, config, ... }:
{
  programs.rclone = {
    enable = true;
    remotes = {
      "infinicloud" = {
        config = {
          type = "webdav";
          url = "https://wani.teracloud.jp/dav/";
          vendor = "other";
          user = "NanamiKento";
        };
        secrets = {
          pass = "${config.home.homeDirectory}/.config/rclone/infinicloud_pass";
        };
        mounts = {
          "/" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/InfiniCloud";
            options = {
              vfs-cache-max-age = "24h";
              vfs-read-chunk-size = "10M";
              dir-cache-time = "5m";
              no-modtime = true;
              volname = "InfiniCloud";
            };
          };
        };
      };
    };
  };
  systemd.user.services."rclone-mount:.@infinicloud" = {
    Unit = {
      After = [
        "network-online.target"
        "time-sync.target"
      ];
      Wants = [
        "network-online.target"
        "time-sync.target"
      ];
    };
    Service = {
      ExecStartPre = pkgs.lib.mkForce "${pkgs.coreutils}/bin/sleep 5";
      Restart = pkgs.lib.mkForce "on-failure";
      RestartSec = pkgs.lib.mkForce "10s";
      StartLimitBurst = 30;
      StartLimitIntervalSec = 300;
    };
  };
}
