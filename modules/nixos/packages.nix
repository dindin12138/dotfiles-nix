{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    killall
    file

    gcc
    clang
    gdb
  ];
}
