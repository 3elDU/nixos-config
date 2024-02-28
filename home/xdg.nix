{ config, pkgs, ... }: {
  xdg = {
    enable = true;

    portal = {
      enable = true;
      config.common = {
        default = [ "wlr" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
      extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
    };
      
    mime.enable = true;
    mimeApps = let
      browser = "firefox.desktop";
      player = "mpv.desktop";
      associations = {
        "inode/directory" = "org.gnome.nautilus.desktop";
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "image/png" = "org.gnome.eog.desktop";
        "image/jpeg" = "org.gnome.eog.desktop";
        "audio/mpeg" = player;
        "audio/ogg" = player;
        "video/mp4" = player;
        "video/mpeg" = player;
        "video/webm" = player;
        "application/pdf" = "org.gnome.evince.desktop";
      };
    in {
      enable = true;
      associations.added = associations;
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
