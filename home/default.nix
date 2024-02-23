{ pkgs, ... }: {
  home.username = "ptflp";
  home.homeDirectory = "/home/ptflp";

  home.stateVersion = "23.11";

  imports = [
    ./wm
    ./desktop
    ./foot.nix
    ./gtk.nix
    ./git.nix
    ./shell.nix
    ./syncthing.nix
    ./neovim.nix
    ./misc-cli.nix
  ];
}
