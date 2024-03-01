{
  description = "Petafloppa's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, xremap, nix-vscode-extensions, ... }@input: let
    palette = builtins.fromJSON (builtins.readFile ./catppuccin/palette.json);
    colorscheme = builtins.trace palette palette.macchiato;
  in {
    nixosConfigurations.slowpoke = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit input palette colorscheme; };
      modules = [
      	./hosts/slowpoke
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
