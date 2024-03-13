{ installGNOMEApps, pkgs, config, ... }: {
  home.packages = if installGNOMEApps then with pkgs; [
    # This is required by (almost) all of gnome apps
    gnome.adwaita-icon-theme

    # Image viewer
    gnome.eog
    # File manager
    gnome.nautilus
    # Previewer for nautilus
    gnome.sushi
    # Archive manager
    gnome.file-roller
    # Integrate compresssed files management with GNOME
    gnome.gnome-autoar
    # System resource monitor
    gnome-usage
    # Taking photos and videos with webcam
    gnome.cheese
    # Weather app
    gnome.gnome-weather
    # Sound recorder
    gnome.gnome-sound-recorder
    # Font viewer
    gnome.gnome-font-viewer
    # Disk utility
    gnome.gnome-disk-utility
    # Calculator
    gnome.gnome-calculator
    # PDF viewer
    evince
  ] else [];
}
