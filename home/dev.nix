{ pkgs, ... }: {
  # Default development utilities
  home.packages = with pkgs; [
    nodejs_20
    gcc
    cargo
    rustc
    go
    python3
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
