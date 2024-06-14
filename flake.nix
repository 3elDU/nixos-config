{
  description = "Petafloppa's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

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
  };

  outputs = { nixpkgs, home-manager, stylix, xremap, nix-vscode-extensions, ... }@inputs: let
    palette = builtins.fromJSON (builtins.readFile ./catppuccin/palette.json);
    flavourName = "macchiato";

    # Information about the current flavour
    flavour = {
      name = palette.${flavourName}.name;
      dark = palette.${flavourName}.dark;
    };
    colorscheme = with palette.${flavourName}; 
      colors // {
        # Currently active window, buttons, active elements, etc.
        primary = colors.mauve;
        # Notifications, overlay windows, modals
        secondary = colors.lavender;
      };

    overlays = [
      # Neovim unstable overlay was here, but since 0.10 is stable, now the list is empty
    ];

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
  in {
    nixosConfigurations = builtins.listToAttrs (builtins.map (system: {
      name = system.name;
      value = nixpkgs.lib.nixosSystem {
        system = system.system;
        specialArgs = {
          inherit inputs overlays palette flavour colorscheme;
          _prefs = system._prefs;
        };
        modules = [
          ./hosts/${system.name}
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
        ];
      };
    }) systems);
  };
}
