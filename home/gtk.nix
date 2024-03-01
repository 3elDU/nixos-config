{ config, lib, pkgs, colorscheme, flavour, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-${flavour.name}-Standard-${colorscheme.primary.name}-${if flavour.dark then "Dark" else "Light"}";
      package = pkgs.catppuccin-gtk.override {
        # Generate accent from the primary color
        accents = [ (lib.strings.toLower colorscheme.primary.name) ];
        variant = (lib.strings.toLower flavour.name);
        tweaks = [ "rimless" "normal" ];
        size = "standard";
      };
    };
  };

  # Also apply the theme to GTK4
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
