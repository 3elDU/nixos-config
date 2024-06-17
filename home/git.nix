{ pkgs, ... }: {
  programs.git = {
    enable = true;

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
    userName = "Zakhar Voloshchuk";
    userEmail = "3elduu@gmail.com";
  };
}
