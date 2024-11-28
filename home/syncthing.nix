{_prefs, ...}: {
  sops.secrets."${_prefs.name}/syncthing/key" = {
    path = "/home/ptflp/.local/state/syncthing/key.pem";
  };
  sops.secrets."${_prefs.name}/syncthing/cert" = {
    path = "/home/ptflp/.local/state/syncthing/cert.pem";
  };

  services.syncthing = {
    enable = true;

    settings = {
      devices.syncthing-server = {
        name = "syncthing-server";
        id = "72LT3M6-I2QKAJL-HZV65YI-7KI2URR-GT2IXJB-R7JCGJU-RRJULVB-VPMWAQL";
        autoAcceptFolders = true;
      };
      folders = {
        dev = {
          id = "bdwea-6f56n";
          path = "~/dev";
        };
        downloads = {
          id = "jm5ry-9lyhz";
          path = "~/dl";
        };
        doc = {
          id = "siwwk-3zedz";
          path = "~/doc";
        };
        pic = {
          id = "onada-w2j7c";
          path = "~/pic";
        };
      };
    };
  };
}
