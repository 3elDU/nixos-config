{ pkgs, ... }: {
  programs.nushell = {
    enable = true;
    package = pkgs.nushellFull;

    configFile.source = ../configs/nushell/config.nu;
    envFile.source = ../configs/nushell/env.nu;

    environmentVariables = {
      EDITOR = "nvim";
      MANPAGER = "'nvim +Man!'";
    };

    shellAliases = {
      ll = "^ls -lAh";

      gcn = "git clone";
      gs = "git status";
      ga = "git add";
      gd = "git diff";
      gc = "git commit";
      gp = "git push";

      n = "nvim";
      h = "htop";
      d = "^du -h1 -d1 -c .";
      t = "touch";

      nr = "sudo nixos-rebuild switch";
    };
  };

  # External command completions used in nushell
  programs.carapace = {
    enable = true;
  };
}
