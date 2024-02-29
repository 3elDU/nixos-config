{ pkgs, ... }: {
  imports = [
    ./cursor.nix
    ./keyring.nix
    ./browsers.nix
    ./fonts.nix
    ./foot.nix
    ./messaging.nix
    ./media.nix
    ./gnome-apps.nix
    ./text.nix
    ./code.nix
    ./xremap.nix
  ];
}
