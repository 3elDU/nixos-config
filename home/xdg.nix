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
      xdgOpenUsePortal = true;
    };
      
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["org.gnome.nautilus.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-terminal-emulator" = ["foot.desktop"];
        "image/png" = ["org.gnome.eog.desktop"];
        "image/jpeg" = ["org.gnome.eog.desktop"];
        "audio/mpeg" = ["mpv.desktop"];
        "audio/ogg" = ["mpv.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/mpeg" = ["mpv.desktop"];
        "video/webm" = ["mpv.desktop"];
        "application/pdf" = ["org.gnome.evince.desktop"];
      };
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
