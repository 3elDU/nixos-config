{ ... }: {
  # Unused
  programs.kitty = {
    enable = false;

    settings = {
      paste_actions = "confirm";

      tab_bar_style = "powerline";
      tab_powerline_style = "round";

      enable_audio_bell = false;
    };
  };

  # Primary terminal
  programs.foot = {
    enable = true;
    settings = {
      main = {
        pad = "8x4";
      };
    };
  };

  # Unused
  programs.alacritty = {
    enable = false;
    settings = {
      bell.duration = 150;
      mouse.hide_when_typing = true;
    };
  };
}
