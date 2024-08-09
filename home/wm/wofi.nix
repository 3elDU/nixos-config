{ _prefs, config, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  stylix.targets.wofi.enable = false;

  # Main wofi color is secondary, since wofi itself is an overlay window
  xdg.configFile."wofi/colors".text = builtins.concatStringsSep "\n" [
    colors.${_prefs.secondaryColor}
    colors.base05
    colors.base01
    colors.base02
  ];

  programs.wofi = {
    enable = _prefs.enableSway;
    settings = {
      color = config.xdg.configFile."wofi/colors".source;
      # Width and height are messed up with fractional scaling
      # see https://todo.sr.ht/~scoopta/wofi/224
      width = "80%";
      height = "60%";
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
