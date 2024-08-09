{ _prefs, pkgs, ... }: {
  home.packages =
    if _prefs.installGNOMEApps then with pkgs; [
      # This is required by (almost) all of gnome apps
      adwaita-icon-theme

      # Image viewer
      eog
      # File manager
      nautilus
      # Previewer for nautilus
      sushi
      # Archive manager
      file-roller
      # Integrate compresssed files management with GNOME
      gnome-autoar
      # System resource monitor
      gnome-usage
      # Taking photos and videos with webcam
      cheese
      # Font viewer
      gnome-font-viewer
      # Disk utility
      gnome-disk-utility
      # Calculator
      gnome-calculator
      # PDF viewer
      evince
    ] else [ ];
}
