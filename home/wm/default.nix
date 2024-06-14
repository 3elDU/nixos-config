{ enableSway, pkgs, ... }: {
  # Window-manager-related configuration

  # WM-related utilities
  home.packages = with pkgs; [
    grim slurp
    wf-recorder
    wl-clipboard
  ];

  imports = [
    ./avizo.nix
    ./sway.nix
    ./wofi.nix
    ./waybar.nix
    ./mako.nix
    ./wob.nix
  ];
}
