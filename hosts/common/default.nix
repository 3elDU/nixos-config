{ enableSway, catppuccinGtkTheme, installGNOMEApps, 
  input,
  colorscheme, palette, flavour, 
  pkgs, overlays,
  ...
}: {
  imports = [
    ./nix.nix
    ./locale.nix
  ];

  nixpkgs.overlays = overlays;

  # Generate manual page index caches to be able to search man pages with apropos(1)
  documentation.man.generateCaches = true;

  # Do not ask for password in sudo
  security.sudo.wheelNeedsPassword = false;

  programs.zsh.enable = true;
  users.users.ptflp = {
    isNormalUser = true;
    description = "Zakhar Voloshchuk";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" ];
    shell = pkgs.zsh;
  };
  security.polkit.enable = true;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { 
      inherit input colorscheme palette flavour;
      # Per-host variables to disable specific features
      inherit enableSway catppuccinGtkTheme installGNOMEApps;
      inherit overlays;
    };
    sharedModules = [ input.xremap.homeManagerModules.default ];
    users.ptflp = ../../home;
  };

  # Allow running unpatched binaries
  programs.nix-ld.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
