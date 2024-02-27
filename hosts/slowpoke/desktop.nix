{ pkgs, ... }: {
  # Desktop-related options

	hardware.opengl.enable = true;

  environment.systemPackages = [ pkgs.greetd.gtkgreet ];
	services.greetd = {
		enable = true;
		settings = {
			terminal.vt = 1;
			default_session = {
				command = "cage -s -- gtkgreet";
				user = "greeter";
			};
		};
	};
	
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		pulse.enable = true;
	};

	services.dbus.enable = true;

	xdg.portal = {
		enable = true;
		wlr.enable = true;
		config.common.default = "gtk";
	};
}
