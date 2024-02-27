{ pkgs, ... }: {
  # Miscellaneous CLI utilities

  home.packages = with pkgs; [
    neofetch # Fetch system information
    tree
    nmap
    ripgrep
  ];
  
  # Process management
  programs.htop.enable = true;
  programs.btop.enable = true;

  # Better cat(1)
  programs.bat.enable = true;

  # GnuPG
  programs.gpg.enable = true;
}
