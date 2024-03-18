{ enableSway, config, pkgs, ... }: {
  xdg = {
    portal = {
      enable = enableSway;
      config.common = {
        default = [ "wlr" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
      extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
    };

    mimeApps = let
      browser = "firefox.desktop";
      player = "mpv.desktop";
      associations = {
        "inode/directory" = "org.gnome.Nautilus.desktop";
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "image/png" = "org.gnome.Eog.desktop";
        "image/jpeg" = "org.gnome.Eog.desktop";
        "audio/mpeg" = player;
        "audio/ogg" = player;
        "video/mp4" = player;
        "video/mpeg" = player;
        "video/webm" = player;
        "application/pdf" = "org.gnome.Evince.desktop";
      };
    in {
      enable = enableSway;
      defaultApplications = associations;
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
