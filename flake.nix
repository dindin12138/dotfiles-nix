{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    nix-colors.url = "github:misterio77/nix-colors";

    st.url = "github:dindin12138/st";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let inherit (self) outputs;
    in {

      nixosConfigurations = {
        "80qs" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/80QS/configuration.nix ];
        };
        tb = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/ThinkBook/configuration.nix ];
        };
      };
    };
}
