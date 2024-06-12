{ pkgs, ... }: {
  # Miscellaneous CLI utilities

  home.packages = with pkgs; [
    neofetch # Fetch system information
    tree # Display directory tree
    nmap # Scan ports
    ripgrep # Search file contents
    # Process management
    htop btop
    # Better cat(1)
    bat
    # For the 'notify-send' command
    libnotify
    # killall, pstree, etc.
    psmisc

    gnupg
    xdg-utils

    # dig
    dnsutils

    # archive tools
    p7zip unrar

    # image utilities
    imagemagick
    # video utilities
    ffmpeg_7
  ];
}
