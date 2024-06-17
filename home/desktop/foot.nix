{ ... }: {
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
