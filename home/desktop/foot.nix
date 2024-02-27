{ pkgs, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "nu";
        font = "JetBrainsMono Nerd Font:size=10";
        pad = "8x4";
      }; 
      colors = {
        alpha = 0.85;
        scrollback-indicator = "000000 D79921";
      };
    };
  };
}
