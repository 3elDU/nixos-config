{ pkgs, ... }: {
  programs.mpv.enable = true;
  home.packages = with pkgs; [
    spotify
    pavucontrol
    helvum
    easyeffects
  ];
}
