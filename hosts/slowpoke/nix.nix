{ pkgs, ... }: {
  nix = {
    gc.automatic = true;
    settings = {
      # Don't warn about dirty Git tree when building flakes
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
    };
  };

  # Flakes clone their dependencies through Git, so
  # it is required
  environment.systemPackages = [ pkgs.git ];
}
