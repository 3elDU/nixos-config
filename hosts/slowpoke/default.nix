# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
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
  time.timeZone = "Europe/Kyiv";

  system.stateVersion = "23.11";
}
