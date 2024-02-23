{ pkgs, ... }: {
  # Obsidian requires EOL version of electron
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  home.packages = with pkgs; [
    libreoffice
    obsidian
  ];
}
