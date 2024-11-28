{_prefs, ...}: {
  sops.secrets."${_prefs.name}/syncthing/key" = {
    path = "/home/ptflp/.local/state/syncthing/key.pem";
  };
  sops.secrets."${_prefs.name}/syncthing/cert" = {
    path = "/home/ptflp/.local/state/syncthing/cert.pem";
  };

  services.syncthing = {
    enable = true;
  };
}
