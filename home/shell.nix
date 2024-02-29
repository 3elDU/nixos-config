{ pkgs, ... }: {
  programs.nushell = {
    enable = true;
    package = pkgs.nushellFull;

    configFile.source = ../configs/nushell/config.nu;
    envFile.source = ../configs/nushell/env.nu;

    environmentVariables = {
      EDITOR = "nvim";
      MANPAGER = "'nvim +Man!'";
      PAGER = "nvimpager";
    };

    shellAliases = {
      cl = "clear";
      ll = "^ls -lAh";

      gcn = "git clone";
      gs = "git status";
      ga = "git add";
      gd = "git diff";
      gc = "git commit";
      gp = "git push";
      gl = "git log";

      n = "nvim";
      h = "htop";
      d = "^du -h1 -d1 -c .";
      t = "touch";

      nr = "sudo nixos-rebuild switch";
    };
  };

  # Those only get sourced by zsh
  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
    PAGER = "nvimpager";
  };

  # Also keep ZSH as a default shell for tasks where POSIX shell is required,
  # e.g. login shell
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "sammy";
      plugins = [ "git" ];
    };

    profileExtra = ''
      # Launch sway, if logged in from tty1
      if [[ "$(tty)" == "/dev/tty1" ]]; then
        exec sway
      fi
    '';
  };

  # External command completions used in nushell
  programs.carapace = {
    enable = true;
  };
}
