{ pkgs, ... }: {
  imports = [
    ./browsers.nix
    ./fonts.nix
    ./foot.nix
    ./messaging.nix
    ./media.nix
    ./gnome-apps.nix
    ./text.nix
  ];
}
