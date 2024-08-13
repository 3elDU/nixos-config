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
}
