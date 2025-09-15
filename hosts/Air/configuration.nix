{
  inputs,
  outputs,
  pkgs,
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
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      din = import ./home.nix;
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    mkalias
    vim
    mas
  ];

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
