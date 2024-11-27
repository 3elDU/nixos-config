{ pkgs, ... }: {
  imports =
    [
      ./hardware-configuration.nix
      ./disko.nix
      ../common
      ./bluetooth.nix
      ./desktop.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "slowpoke"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Enable udisks
  services.udisks2 = {
    enable = true;
    mountOnMedia = true;
  };

  # Enable periodic SSD TRIM
  services.fstrim.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Taken from https://nixos.wiki/wiki/Accelerated_Video_Playback
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  system.stateVersion = "23.11";
}
