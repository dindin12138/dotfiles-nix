{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      wechat-uos
      # (wechat-uos.override {
      # https://github.com/nix-community/nur-combined/tree/master/repos/xddxdd/pkgs/uncategorized/wechat-uos
      # uosLicense = ./license.tar.gz;
      # })
    ];
}
