{ lib, colorscheme, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "nu";
        font = "JetBrainsMono Nerd Font:size=10";
        pad = "8x4";
      }; 
      colors = let 
        # Remove '#' prefix from hex colors
        # "#24273a" -> "24273a"
        colors = builtins.mapAttrs
          (name: value: 
            lib.strings.removePrefix "#" value.hex
          )
          colorscheme;
      in {
        # alpha = 0.85;
        
        # Scrollbar background and scrollbar color
        scrollback-indicator = "${colors.base} ${colors.overlay0}";

        foreground = colors.text;
        background = colors.base;
        regular0 = colors.surface1;
        regular1 = colors.red;
        regular2 = colors.green;
        regular3 = colors.yellow;
        regular4 = colors.blue;
        regular5 = colors.pink;
        regular6 = colors.teal;
        regular7 = colors.subtext1;
        bright0 = colors.surface2;
        bright1 = colors.red;
        bright2 = colors.green;
        bright3 = colors.yellow;
        bright4 = colors.blue;
        bright5 = colors.pink;
        bright6 = colors.teal;
        bright7 = colors.subtext0;
      };
    };
  };
}
