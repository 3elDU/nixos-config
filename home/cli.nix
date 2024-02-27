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
    
    gnupg
  ];
}
