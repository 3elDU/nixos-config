{ config, colorscheme, ... }: {
  # Main wofi color is secondary, since wofi itself is an overlay window
  xdg.configFile."wofi/colors".text = ''
    ${colorscheme.secondary.hex}
    ${colorscheme.text.hex}
    ${colorscheme.base.hex}
  '';

  programs.wofi = {
    enable = true;
    settings = {
      color = config.xdg.configFile."wofi/colors".source;
      allow_images = true;
      insensitive = true;
      mode = "drun,run";
      term = "foot";
      image_size = 24;
      key_up = "Alt_L-k";
      key_down = "Alt_L-j";
      key_expand = "Alt_L-l";
    };
    style = (builtins.readFile ../../configs/wofi/style.css);
  };
}
