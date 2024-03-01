# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ input, colorscheme, palette, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nix.nix
      ./locale.nix
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

  # Generate manual page index caches to be able to search man pages with apropos(1)
  documentation.man.generateCaches = true;

  # Do not ask for password in sudo
  security.sudo.wheelNeedsPassword = false;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  programs.zsh.enable = true;
  users.users.ptflp = {
    isNormalUser = true;
    description = "Zakhar Voloshchuk";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" ];
    shell = pkgs.zsh;
  };
  security.polkit.enable = true;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit input colorscheme palette; };
    sharedModules = [ input.xremap.homeManagerModules.default ];
    users.ptflp = ../../home;	
  };

  # Allow running unpatched binaries
  programs.nix-ld.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
