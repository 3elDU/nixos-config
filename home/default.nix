{ ... }: {
  home.username = "ptflp";
  home.homeDirectory = "/home/ptflp";

  home.stateVersion = "23.11";

  imports = [
    ./wm
    ./desktop
    ./gtk.nix
    ./qt.nix
    ./git.nix
    ./gpg.nix
    ./shell.nix
    ./syncthing.nix
    ./neovim.nix
    ./cli.nix
    ./xdg.nix
  ];
}
