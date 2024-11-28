{ ... }: {
  services.syncthing = {
    enable = true;
    group = "ptflp";
    user = "ptflp";
    dataDir = ""
      };
  }
