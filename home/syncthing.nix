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
      devices = {
        syncthing-server = {
          name = "syncthing-server";
          id = "72LT3M6-I2QKAJL-HZV65YI-7KI2URR-GT2IXJB-R7JCGJU-RRJULVB-VPMWAQL";
          autoAcceptFolders = true;
        };
      };
      folders = {
        "/home/ptflp/dev" = {
          id = "bdwea-6f56n";
          devices = ["syncthing-server"];
        };
        "/home/ptflp/dl" = {
          id = "jm5ry-9lyhz";
          devices = ["syncthing-server"];
        };
        "/home/ptflp/doc" = {
          id = "siwwk-3zedz";
          devices = ["syncthing-server"];
        };
        "/home/ptflp/pic" = {
          id = "onada-w2j7c";
          devices = ["syncthing-server"];
        };
      };
    };
  };
}
