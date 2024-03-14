{ pkgs, ... }: {
  programs.steam = {
    enable = true;
  };
  # Make steam-run generally available in the system
  environment.systemPackages = with pkgs; [
    steam-run
  ];
}
