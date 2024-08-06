{
  description = "Petafloppa's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
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

    base16 = {
      url = "github:SenchoPens/base16.nix";
    };
    cattpuccin-base16 = {
      url = "github:catppuccin/base16";
      flake = false;
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    minimal-tmux-status = {
      url = "github:niksingh710/minimal-tmux-status";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, sops-nix, stylix, disko, ... }@inputs:
    let
      overlays = [
        # Neovim unstable overlay was here, but since 0.10 is stable, now the list is empty
      ];

      primaryColor = "base0E"; # Mauve in catppuccin
      secondaryColor = "base07"; # Lavender in catppuccin

      systems = [
        {
          name = "slowpoke";
          system = "x86_64-linux";
          _prefs = {
            enableSway = true;
            catppuccinGtkTheme = true;
            installGNOMEApps = true;
          };
        }
        {
          name = "heater";
          system = "x86_64-linux";
          _prefs = {
            enableSway = false;
            catppuccinGtkTheme = false;
            installGNOMEApps = false;
          };
        }
      ];
    in
    {
      nixosConfigurations = builtins.listToAttrs (builtins.map
        (system: {
          name = system.name;
          value = nixpkgs.lib.nixosSystem {
            system = system.system;
            specialArgs = {
              inherit inputs overlays;
              _prefs = system._prefs // {
                # Extend _prefs with info about the running system
                name = system.name;
                system = system.system;
                flakePath = toString ./.;
                inherit primaryColor secondaryColor;
              };
            };
            modules = [
              ./hosts/${system.name}
              disko.nixosModules.disko
              home-manager.nixosModules.home-manager
              stylix.nixosModules.stylix
              sops-nix.nixosModules.sops
            ];
          };
        })
        systems);
    };
}
