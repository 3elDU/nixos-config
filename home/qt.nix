{ enableSway, config, ... }: {
  qt = {
    enable = enableSway;
    platformTheme.name = "gtk3";
  };
}
