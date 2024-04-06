{ pkgs, ... }: {
  services.gpg-agent = {
    enable = true;
    enableNushellIntegration = true;
    pinentryPackage = pkgs.pinentry-gtk2;
  };
}
