{
  inputs,
  _prefs,
  pkgs,
  overlays,
  firefox-addons,
  ...
}: {
  imports = [
    ./dns.nix
    ./nix.nix
    ./locale.nix
    ./services.nix
    ./stylix.nix
    ./sops.nix
    ./users.nix
  ];

  nixpkgs.overlays = overlays;

  # Generate manual page index caches to be able to search man pages with apropos(1)
  documentation.man.generateCaches = true;

  # Do not ask for password in sudo
  security.sudo.wheelNeedsPassword = false;

  # Taken from https://nixos.wiki/wiki/Sway
  security.pam.loginLimits = [
    {
      domain = "@users";
      item = "rtprio";
      type = "-";
      value = 1;
    }
  ];

  # Required for home-manager
  security.polkit.enable = true;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs overlays firefox-addons;
      # Per-host variables to disable specific features
      inherit _prefs;
    };
    sharedModules = [
      inputs.xremap.homeManagerModules.default
      inputs.sops-nix.homeManagerModules.sops
    ];
    users.ptflp = ../../home;
  };

  # Allow -o allow_other when running sshfs as a regular user
  programs.fuse.userAllowOther = true;

  # Taken from home-configuration.nix(5) xdg.portal.enable
  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];

  # Enable memory compression via zram-swap
  zramSwap.enable = true;
  zramSwap.algorithm = "zstd";

  # Allow running unpatched binaries
  programs.nix-ld.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
