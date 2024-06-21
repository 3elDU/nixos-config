{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [
    grim
    slurp
    shotman
    swappy
  ];

  xdg.configFile."swappy/config".text = lib.generators.toDconfINI {
    "Default" = {
      save_dir = "${config.home.homeDirectory}/pic/sc";
      save_filename_format = "Screenshot_%Y-%m-%d_%H-%M-%S.png";
      early_exit = true;
    };
  };
}
