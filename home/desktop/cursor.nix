{ pkgs, ... }: {
  home.pointerCursor = {
    name = "Simp1e-Gruvbox-Dark";
    package = pkgs.simp1e-cursors;
    size = 24;

    gtk = {
      enable = true;
    };
    x11 = {
      enable = true;
      defaultCursor = "Simp1e-Gruvbox-Dark";
    };
  };
}
