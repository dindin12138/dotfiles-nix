{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-session --cmd sway";
        user = "greeter";
      };
    };
  };
}
