{
  description = "Petafloppa's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@input: {
    nixosConfigurations.slowpoke = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit input; };
      modules = [
      	./hosts/slowpoke
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
