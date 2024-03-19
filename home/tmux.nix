{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    prefix = "C-Space";
    shell = "${pkgs.nushell}/bin/nu";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          # Don't fill unactive windows at all
          set -g @catppuccin_window_default_fill "none"
          # Fill the selected windows
          set -g @catppuccin_window_current_fill "all"
          set -g @catppuccin_window_middle_separator " "

          set -g @catppuccin_status_modules_right "application session date_time"
          set -g @catppuccin_status_left_separator  ""
          set -g @catppuccin_status_fill "all"
        '';
      }
    ];
    extraConfig = ''
      set-option -u default-terminal
      # Enable truecolor support
      set-option -ga terminal-overrides ",xterm*:Tc"

      # Reduce escape time
      set-option -g escape-time 0

      # Switch to next window on double C-Space
      bind C-Space next-window
    '';
  };
}
