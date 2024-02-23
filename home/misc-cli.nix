{ pkgs, ... }: {
  # Miscellaneous CLI utilities

  home.packages = with pkgs; [
    neofetch # Fetch system information
  ];
  
  # Process management
  programs.htop.enable = true;
  programs.btop.enable = true;

  # Better cat(1)
  programs.bat.enable = true;
}
