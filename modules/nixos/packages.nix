{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    killall
    file

    # gcc
    clang
    ninja
    # libcxx
    # gdb
    # lldb
  ];
}
