{ pkgs, ... }: {
  services.mako = {
    enable = true;

    font = "JetBrainsMono Nerd Font Propo 10";

    defaultTimeout = 5;

    anchor = "top-center";
    margin = "6";
    padding = "8";

    backgroundColor = "#282828FF";
    textColor = "#FBF1C7FF";
    progressColor = "#D79921FF";
    borderColor = "#D79921FF";

    borderRadius = 8;
    borderSize = 4;
  };
}
