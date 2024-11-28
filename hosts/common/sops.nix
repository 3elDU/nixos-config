{
  pkgs,
  config,
  lib,
  ...
}: let
  me = config.users.users.ptflp;
in {
  # Install sops CLI tools system-wide
  environment.systemPackages = [pkgs.sops];

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/var/lib/sops-nix/key.txt";

  sops.secrets.wakatime_api_key = {};
  sops.templates.wakatime_api_key = {
    # Write wakatime configuration file at ~/.wakatime.cfg
    path = "${me.home}/.wakatime.cfg";
    owner = "${me.name}";
    content = lib.generators.toINI {} {
      settings = {
        api_key = config.sops.placeholder.wakatime_api_key;
      };
    };
  };

  sops.secrets.intelephsense_key = {
    owner = me.name;
  };
}
