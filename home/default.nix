{ ... }: {
  home.username = "ptflp";
  home.homeDirectory = "/home/ptflp";

  home.stateVersion = "23.11";

  # Generate manual page index, so the manpages for programs installed
  # by home manager could be searched with apropos
  programs.man.generateCaches = true;

  imports = [
    ./wm
    ./desktop
    ./git.nix
    ./gpg.nix
    ./shell.nix
    ./syncthing.nix
    ./neovim.nix
    ./cli.nix
    ./xdg.nix
    ./tmux.nix
    ./udiskie.nix
    ./dev.nix
  ];
}
