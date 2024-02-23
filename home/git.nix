{ pkgs, ... }:{
  programs.git = {
    enable = true;
    
    extraConfig = {
      init.defaultBranch = "main";
    };
    userName = "Zakhar Voloshchuk";
    userEmail = "3elduu@gmail.com";
  };
}
