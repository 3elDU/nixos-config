{ _prefs, pkgs, ... }: {
  qt = {
    enable = _prefs.enableSway;
    platformTheme.name = "gtk3";
    style.package = pkgs.adwaita-qt;
  };
}
