{ pkgs, xremap, ... }: {
  services.xremap = {
    withWlroots = true;

    config.keymap = [
      {
        name = "Alt+h to left arrow";
        remap = { "M-h" = "LEFT"; };
      }
      {
        name = "Alt+j to down arrow";
        remap = { "M-j" = "DOWN"; };
      }
      {
        name = "Alt+k to up arrow";
        remap = { "M-k" = "UP"; };
      }
      {
        name = "Alt+l to right arrow";
        remap = { "M-l" = "RIGHT"; };
      }
    ];
  };
}
