{ ... }:
let
  # Universal shell alises for both nushell and zsh
  aliases = {
    cl = "clear";

    gcn = "git clone";
    gs = "git status";
    ga = "git add";
    gd = "git diff";
    gc = "git commit";
    gp = "git push";
    gl = "git log";

    n = "nvim";
    h = "htop";
    t = "touch";

    s = "kitten ssh";
    sfs = "sshfs -o allow_other,max_conns=8,reconnect -C";

    tm = "tmux";
    tma = "tmux attach -t";
    tmn = "tmux new -t";

    nr = "nh os switch";
    nrb = "nh os boot";
    nra = "nh oh switch --ask";
  };
  environment = {
    FLAKE = "/home/ptflp/dev/nixos";
    EDITOR = "nvim";
    PAGER = "nvimpager";
  };
in
{
  # Unused for now. Decided to stick with ZSH
  programs.nushell = {
    enable = true;

    configFile.source = ../configs/nushell/config.nu;
    envFile.source = ../configs/nushell/env.nu;

    environmentVariables = environment // {
      MANPAGER = "'nvim +Man!'";
    };

    shellAliases = aliases // {
      # Those are shell aliases specific for nushell

      ll = "^ls -lAh";
      d = "du --all --max-depth 0";
    };

    extraConfig = builtins.readFile ../configs/nushell/extras.nu;
  };

  # Those only get sourced by zsh
  home.sessionVariables = environment;

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

    shellAliases = aliases;

    profileExtra = ''
      # Launch sway, if logged in from tty1
      if [[ "$(tty)" == "/dev/tty1" ]]; then
        exec sway
      fi
    '';
  };

  # External command completions used in nushell
  programs.carapace = {
    enable = false;
  };
}
