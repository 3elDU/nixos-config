{ _prefs, ... }: {
  qt = {
    enable = _prefs.enableSway;
    platformTheme.name = "gtk3";
  };
}
