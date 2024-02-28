{ pkgs, ... }: let
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
in {
  # Desktop-related options

  environment.systemPackages = with pkgs; [ dbus-sway-environment ];

	hardware.opengl = {
    enable = true;
    # Enable accelerated video playback
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };

  # environment.systemPackages = with pkgs; [ greetd.regreet cage ];
	# services.greetd = {
	# 	enable = true;
	# 	settings = {
	# 		terminal.vt = 1;
	# 		default_session = {
	# 			command = "cage -s -- regreet";
	# 			user = "greeter";
	# 		};
	# 	};
	# };
	
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		pulse.enable = true;
	};

	services.dbus.enable = true;
  programs.dconf.enable = true;
}
