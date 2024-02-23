{ pkgs, ... }: {
  home.username = "ptflp";
  home.homeDirectory = "/home/ptflp";

  home.stateVersion = "23.11";

  imports = [
    ./wm
    ./desktop
    ./foot.nix
    ./sway.nix
    ./gtk.nix
    ./git.nix
    ./shell.nix
    ./syncthing.nix
    ./wofi.nix
    ./neovim.nix
    ./misc-cli.nix
  ];
}
