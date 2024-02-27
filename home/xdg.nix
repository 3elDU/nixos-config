{ config, pkgs, ... }: {
  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    download = "${config.home.homeDirectory}/dl";
    documents = "${config.home.homeDirectory}/doc";
    desktop = "${config.home.homeDirectory}/desk";
    music = "${config.home.homeDirectory}/mus";
    pictures = "${config.home.homeDirectory}/pic";
    videos = "${config.home.homeDirectory}/vid";
  };
}
