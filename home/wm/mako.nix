{ enableSway, colorscheme, ... }: {
  services.mako = {
    enable = enableSway;

    font = "RecMonoDuotone Nerd Font 12";

    defaultTimeout = 5000;

    # This is the *maximum* height
    height = 192;

    anchor = "top-right";
    margin = "8";
    padding = "12";

    borderSize = 2;

    backgroundColor = colorscheme.crust.hex;
    textColor = colorscheme.text.hex;
    progressColor = "over ${colorscheme.secondary.hex}";
    borderColor = colorscheme.secondary.hex;
  };
}
