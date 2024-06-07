{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    killall
    gcc
    clang
    gdb
  ];
}
