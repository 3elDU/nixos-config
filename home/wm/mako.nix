{ colorscheme, ... }: {
  services.mako = {
    enable = true;

    font = "JetBrainsMono Nerd Font Propo 10";

    defaultTimeout = 5000;

    # This is the *maximum* height
    height = 192;

    anchor = "top-right";
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
