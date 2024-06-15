{ _prefs, ... }: {
  services.mako = {
    enable = _prefs.enableSway;

    defaultTimeout = 5000;

    # This is the *maximum* height
    height = 192;

    anchor = "top-right";
    margin = "8";
    padding = "12";

    borderSize = 3;
  };
}
