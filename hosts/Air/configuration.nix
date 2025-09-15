{
  inputs,
  outputs,
  self,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew

    ../../modules/darwin/apps-alias.nix
    ../../modules/darwin/nix.nix
    ../../modules/darwin/homebrew.nix
    ../../modules/darwin/users.nix

    ../../modules/darwin/packages.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      din = import ./home.nix;
    };
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
