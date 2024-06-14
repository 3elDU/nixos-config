{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    font = {
      name = "RecMonoDuotone Nerd Font";
      size = 12;
    };

    settings = {
      shell = "${pkgs.nushell}/bin/nu -l -i";

      paste_actions = "confirm";

      tab_bar_style = "powerline";
      tab_powerline_style = "round";
    };

    theme = "Catppuccin-Macchiato";
  };
}
