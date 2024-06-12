{ pkgs, ... }: {
  # Default development utilities
  home.packages = with pkgs; [
    nodejs_20
    gcc
    cargo rustc
    go
    python3
  ];
}
