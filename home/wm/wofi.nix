{ pkgs, config, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      color = "${../../configs/wofi/colors}";
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
