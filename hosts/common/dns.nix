{...}: {
  # Custom hosts for use with local services
  networking.extraHosts = builtins.concatStringsSep "\n" [
    "127.0.0.1  syncthing.local"
  ];
}
