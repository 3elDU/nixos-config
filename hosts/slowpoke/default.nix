# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nix.nix
      ./locale.nix
      ./bluetooth.nix
      ./desktop.nix
      ../../programs
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

  # Generate manual page index caches to be able to search man pages with apropos(1)
  documentation.man.generateCaches = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  users.users.ptflp = {
    isNormalUser = true;
    description = "Zakhar Voloshchuk";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" ];
    packages = with pkgs; [];
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.ptflp = import ../../home;	
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
