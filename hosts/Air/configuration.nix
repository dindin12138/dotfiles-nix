{
  inputs,
  outputs,
  self,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.stylix.darwinModules.stylix

    ../../modules/darwin/nix.nix
    ../../modules/darwin/homebrew.nix
    ../../modules/darwin/users.nix
    ../../modules/darwin/packages.nix
    ../../modules/darwin/stylix.nix
  ];

  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      din = import ./home.nix;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  # environment.variables = {
  #   HTTP_PROXY = "http://127.0.0.1:7897";
  #   HTTPS_PROXY = "http://127.0.0.1:7897";
  # };

  system.primaryUser = "din";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
