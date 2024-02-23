{ config, pkgs, ... }:
let
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
    { config = config.nixpkgs.config; };
in
{
	environment.systemPackages = with pkgs; [
		wayland
		xdg-utils
		# Screenshots
		grim
		slurp
		# Clipboard management from terminal
		wl-clipboard
		# Launcher
		wofi
		# Bar
		waybar
		# Recording screen
		wf-recorder

		swayfx

		# Display manager
		greetd.gtkgreet
		cage

		# Terminal emulator
		foot
		alacritty

		# For pactl
		pulseaudio

		# For notify-send
		libnotify

		# Notification daemon
		mako
		# On-screen display (when changing volume, brightness, etc.)
		unstable.avizo
		# Lockscreen
		gtklock
	];
}
