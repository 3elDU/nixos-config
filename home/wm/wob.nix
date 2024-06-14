{ colorscheme, ... }: {
  services.wob = {
    enable = true;
    settings = {
      "" = {
        timeout = 3000;

        border_size = 2;
        border_offset = 2;

        border_color = colorscheme.secondary.hex;
        background_color = colorscheme.crust.hex;
        bar_color = colorscheme.secondary.hex;

        overflow_bar_color = colorscheme.red.hex;
        overflow_border_color = colorscheme.red.hex;
      };
      "style.brightness" = {
        border_color = colorscheme.yellow.hex;
        bar_color = colorscheme.yellow.hex;
      };
    };
  };
}
