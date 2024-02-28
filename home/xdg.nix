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
