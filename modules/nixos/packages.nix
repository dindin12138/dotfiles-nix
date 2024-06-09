{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    killall
    gcc
    clang
    gdb
  ];
}
