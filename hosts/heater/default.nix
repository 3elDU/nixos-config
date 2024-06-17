{ config, pkgs, ... }: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
      ./steam.nix
    ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  # For ntfsfix and other utilities
  environment.systemPackages = [ pkgs.ntfs3g ];

  # Enable zram
  zramSwap.enable = true;

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;
    # By default boot from the previously selected system
    default = "saved";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Keep system clock in local time.
  # For dual booting with Windows
  time.hardwareClockInLocalTime = true;

  networking.hostName = "heater"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  system.stateVersion = "23.11";
}
