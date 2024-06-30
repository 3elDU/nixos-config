{ inputs, _prefs, pkgs, overlays, ... }: {
  imports = [
    ./nix.nix
    ./locale.nix
    ./services.nix
    ./stylix.nix
    ./sops.nix
  ];

  nixpkgs.overlays = overlays;

  # Generate manual page index caches to be able to search man pages with apropos(1)
  documentation.man.generateCaches = true;

  # Do not ask for password in sudo
  security.sudo.wheelNeedsPassword = false;

  security.pam.loginLimits = [
    # Taken from https://nixos.wiki/wiki/Sway
    { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
  ];

  programs.zsh.enable = true;
  users.users.ptflp = {
    isNormalUser = true;
    description = "Zakhar Voloshchuk";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "input"
      "render"
      "dialout"
    ];
    shell = pkgs.zsh;
  };
  security.polkit.enable = true;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs overlays;
      # Per-host variables to disable specific features
      inherit _prefs;
    };
    sharedModules = [ inputs.xremap.homeManagerModules.default ];
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
