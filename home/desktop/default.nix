{ pkgs, ... }: {
  imports = [
    ./browsers.nix
    ./messaging.nix
    ./media.nix
    ./gnome-apps.nix
    ./text.nix
  ];
}
