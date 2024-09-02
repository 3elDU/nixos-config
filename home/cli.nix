{ pkgs, ... }: {
  # Miscellaneous CLI utilities

  home.packages = with pkgs; [
    neofetch # Fetch system information
    tree # Display directory tree
    nmap # Scan ports
    ripgrep # Search file contents
    # Process management
    htop
    btop
    # Better cat(1)
    bat
    # For the 'notify-send' command
    libnotify
    # killall, pstree, etc.
    psmisc
    # show information about the file
    file
    # lsusb
    usbutils
    # serial console I/O
    minicom

    gnupg
    xdg-utils

    # dig
    dnsutils

    # archive tools
    p7zip
    unrar-free
    libarchive

    # image utilities
    imagemagick
    # video utilities
    ffmpeg_7

    # Images and videos in the terminal!
    timg
    swayimg

    # Make nix better!
    # https://github.com/viperML/nh
    nh
    # https://github.com/maralorn/nix-output-monitor
    nix-output-monitor
    # https://gitlab.com/khumba/nvd
    nvd
    # Inspect nix system configuration
    nix-inspect
    # Browse dependencies of nix derivations
    nix-tree

    # Mount filesystems over SSH
    sshfs
  ];
}
