{ pkgs, ... }: {
  programs.zsh.enable = true;
  
  users.users = {
    root.hashedPassword = "$y$j9T$GWM20wfcCL4N5ZEdK8mAi.$U4ImRzRW5RNL6tJWddScLlUsDJ.VjP6bgF30GamDF/2";

    ptflp = {
      isNormalUser = true;
      description = "Zakhar Voloshchuk";
      hashedPassword = "$y$j9T$6KBHbEZbXoN7eYHrUVclt/$6atvTPNjvjOEtO3HkitKuctVB1ekS2WAg7.9sfDT5l8";
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "audio"
        "input"
        "render"
        "dialout"
      ];
      shell = pkgs.zsh;
    };
  };
}
