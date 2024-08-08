{ _prefs, config, pkgs, ... }: {
  xdg = {
    portal = {
      enable = _prefs.enableSway;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };

    userDirs = {
      enable = true;
      createDirectories = true;

      download = "${config.home.homeDirectory}/dl";
      documents = "${config.home.homeDirectory}/doc";
      desktop = "${config.home.homeDirectory}/desk";
      music = "${config.home.homeDirectory}/mus";
      pictures = "${config.home.homeDirectory}/pic";
      videos = "${config.home.homeDirectory}/vid";
      templates = "${config.home.homeDirectory}/tmpl";
      publicShare = "${config.home.homeDirectory}/pub";
    };
  };
}
