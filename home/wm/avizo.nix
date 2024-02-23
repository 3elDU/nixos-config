{ pkgs, ... }: {
  services.avizo = {
    enable = true;
    settings = {
      default = {
        time = 3.0;
        
        width = 240;
        height = 172;
        padding = 16;
        
        border-radius = 8;
        border-width = 2;
        
        block-height = 10;
        block-spacing = 1;

        fade-out = 0.5;

        background = "rgba(40, 40, 40, 0.65)";
        border-color = "rgba(215, 153, 33, 1.0)";
        bar-fg-color = "rgba(215, 153, 33, 1.0)";
        bar-bg-color = "#3c3836";
      };
    };
  };
}
