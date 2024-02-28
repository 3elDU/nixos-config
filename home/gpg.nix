{ pkgs, ... }: {
  services.gpg-agent = {
    enable = true;
    enableNushellIntegration = true;
    pinentryFlavor = "gtk2";
  };
}
