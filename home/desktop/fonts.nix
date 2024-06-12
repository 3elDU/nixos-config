{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    font-awesome
    recursive
    (nerdfonts.override { fonts = [ "Recursive" "FiraCode" "JetBrainsMono" ]; })
  ];
}
