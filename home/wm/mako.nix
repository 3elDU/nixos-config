{ colorscheme, ... }: {
  services.mako = {
    enable = true;

    font = "JetBrainsMono Nerd Font Propo 10";

    defaultTimeout = 5000;

    anchor = "top-center";
    margin = "8";
    padding = "12";

    backgroundColor = colorscheme.base.hex;
    textColor = colorscheme.text.hex;
    progressColor = colorscheme.secondary.hex;
    borderColor = colorscheme.secondary.hex;

    borderRadius = 8;
    borderSize = 4;
  };
}
