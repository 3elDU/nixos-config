{ pkgs, ... }: {
  # Desktop-related options

  hardware.opengl = {
    enable = true;
    # Enable accelerated video playback
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;
  programs.dconf.enable = true;

  # Allow user to access /dev/input and /dev/uinput, required for xremap to work
  hardware.uinput.enable = true;
  users.groups.uinput.members = [ "ptflp" ];
}
