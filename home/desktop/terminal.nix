{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    settings = {
      shell = "${pkgs.nushell}/bin/nu -l -i";

      paste_actions = "confirm";

      tab_bar_style = "powerline";
      tab_powerline_style = "round";

      enable_audio_bell = false;
    };
  };
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "nu";
        pad = "8x4";
      };
    };
  };
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "${pkgs.nushell}/bin/nu";
        args = [ "-l" "-i" ];
      };
      bell.duration = 150;
      mouse.hide_when_typing = true;
    };
  };
}
