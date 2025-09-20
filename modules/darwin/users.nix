{ pkgs, ... }:
{
  users.users = {
    din = {
      name = "din";
      home = "/Users/din";
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ];
    };
  };
}
