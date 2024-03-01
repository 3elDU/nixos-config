{ colorscheme, ... }: {
  services.avizo = {
    enable = true;
    settings = {
      default = {
        time = 3.0;

        width = 240;
        height = 172;
        padding = 12;

        border-radius = 12;
        border-width = 4;

        block-height = 10;
        block-spacing = 1;

        fade-out = 0.5;

        background = colorscheme.base.hex;
        border-color = colorscheme.secondary.hex;
        bar-fg-color = colorscheme.secondary.hex;
        bar-bg-color = colorscheme.surface0.hex;
      };
    };
  };
}
