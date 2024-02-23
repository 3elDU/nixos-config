{ pkgs, ... }: {
  services.mako = {
    enable = true;

    font = "JetBrainsMono Nerd Font Propo 12";

    margin = "8";
    padding = "8";

    backgroundColor = "#282828BF";
    textColor = "#FBF1C7FF";
    progressColor = "D79921FF";
    borderColor = "#D79921FF";

    borderRadius = 8;
    borderSize = 2;
  };
}
