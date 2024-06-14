{ enableSway, config, colorscheme, ... }: {
  # Main wofi color is secondary, since wofi itself is an overlay window
  xdg.configFile."wofi/colors".text = ''
    ${colorscheme.secondary.hex}
    ${colorscheme.text.hex}
    ${colorscheme.crust.hex}
    ${colorscheme.surface0.hex}
  '';

  programs.wofi = {
    enable = enableSway;
    settings = {
      color = config.xdg.configFile."wofi/colors".source;
      allow_images = true;
      allow_markup = true;
      exec_search = true;
      insensitive = true;
      mode = "drun,run";
      term = "foot";
      image_size = 24;
      key_up = "Alt-k";
      key_down = "Alt-j";
      key_expand = "Alt-l";
    };
    style = (builtins.readFile ../../configs/wofi/style.css);
  };
}
