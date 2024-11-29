{ pkgs, ... }: {
  home.packages = with pkgs; [
    telegram-desktop
    # Vesktop is discord with vencord preinstalled
    # + screen sharing works on wayland
    vesktop
  ];
}
