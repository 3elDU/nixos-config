{ _prefs, colorscheme, ... }: {
  services.avizo = {
    enable = _prefs.enableSway;
    settings = {
      default = {
        time = 3.0;

        width = 240;
        height = 172;
        padding = 12;

        border-width = 2;
        border-radius = 0;

        block-height = 10;
        block-spacing = 1;

        fade-out = 0.5;
      };
    };
  };
}
