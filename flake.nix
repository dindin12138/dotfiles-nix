{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "git+ssh://git@github.com/nixos/nixpkgs.git?ref=nixos-unstable&shallow=1";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      # url = "git+ssh://git@github.com/nix-darwin/nix-darwin?ref=master&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    # nix-homebrew.url = "git+ssh://git@github.com/zhaofengli/nix-homebrew?shallow=1";

    homebrew-din = {
      url = "github:dindin12138/homebrew-din";
      # url = "git+ssh://git@github.com/dindin12138/homebrew-din?shallow=1";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      # url = "git+ssh://git@github.com/nix-community/home-manager?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      # url = "git+ssh://git@github.com/nix-community/disko?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # niri.url = "git+ssh://git@github.com/sodiboo/niri-flake?shallow=1";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    st.url = "github:dindin12138/st";
    # st.url = "git+ssh://git@github.com/dindin12138/st?shallow=1";
    nixvim.url = "github:dindin12138/nixvim";
    # nixvim.url = "git+ssh://git@github.com/dindin12138/nixvim?shallow=1";

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
      inputs.dms-cli.follows = "dms-cli";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      darwinConfigurations = {
        "Air" = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit self inputs outputs; };
          modules = [ ./hosts/Air/configuration.nix ];
        };
      };

      nixosConfigurations = {
        "80qs" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/80QS/configuration.nix ];
        };
        "tb" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/ThinkBook/configuration.nix ];
        };
      };
    };
}
