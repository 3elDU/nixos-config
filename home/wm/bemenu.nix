{ ... }: {
  programs.bemenu = {
    enable = true;
    settings = {
      binding = "vim";
      vim-esc-exits = true;
      list = "5 down";
      wrap = true;
      scrollbar = "autohide";
      line-height = 32;
      ignorecase = true;
      counter = "always";
    };
  };
}
