{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    prefix = "C-Space";
    shell = "${pkgs.nushell}/bin/nu";
    extraConfig = ''
      set-option -u default-terminal
      # Enable truecolor support
      set-option -ga terminal-overrides ",xterm*:Tc"

      # Reduce escape time
      set-option -g escape-time 20
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
      }
    ];
  };
}
