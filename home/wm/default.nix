{ pkgs, ... }: {
  # Window-manager-related configuration

  # WM-related utilities
  home.packages = with pkgs; [
    wf-recorder
    wl-clipboard
  ];

  imports = [
    ./sway.nix
    ./wofi.nix
    ./waybar.nix
    ./mako.nix
    ./wob.nix
    ./clipboard.nix
    ./screenshots.nix
  ];
}
