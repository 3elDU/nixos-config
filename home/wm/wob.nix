{ config, ... }:
let
  colorscheme = config.lib.stylix.colors;
  secondary = colorscheme.base07;
in
{
  services.wob = {
    enable = true;

    settings = {
      "" = {
        timeout = 3000;

        border_size = 2;
        border_offset = 2;

        border_color = secondary;
        background_color = colorscheme.base01;
        bar_color = secondary;

        overflow_bar_color = colorscheme.red;
        overflow_border_color = colorscheme.red;
      };
      "style.brightness" = {
        border_color = colorscheme.yellow;
        bar_color = colorscheme.yellow;
      };
      "style.muted" = {
        border_color = colorscheme.red;
        bar_color = colorscheme.red;
      };
    };
  };
}
