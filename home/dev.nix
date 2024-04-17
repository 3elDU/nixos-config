{ pkgs, ... }: {
  # Default development utilities
  home.packages = with pkgs; [
    nodejs_21
    gcc
    cargo rustc
    go
  ];
}
