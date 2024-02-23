{ pkgs, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "nu";
        font = "JetBrainsMono Nerd Font:size=10";
      }; 
      colors = {
        alpha = 0.85;
      };
    };
  };
}
