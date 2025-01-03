{ pkgs, inputs, config, _prefs, ... }: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    aggressiveResize = true;

    mouse = true;
    prefix = "C-Space";

    plugins = [
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = pkgs.tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-save-interval '1'
        '';
      }
      {
        plugin = inputs.minimal-tmux-status.packages."${pkgs.system}".default;
        extraConfig = ''
          set -g @minimal-tmux-bg "${config.lib.stylix.colors.withHashtag.${_prefs.primaryColor}}"
        '';
      }
    ];
    extraConfig = with config.lib.stylix.colors.withHashtag; ''
      # Override default "screen" terminal type
      # Among other things, now tmux will support italics
      set-option -g default-terminal "tmux-256color"

      # Override the emacs key mode set by sensible tmux
      set-option -g status-keys vi
      set-window-option -g mode-keys vi

      set-option -u default-terminal
      # Enable truecolor support
      set-option -ga terminal-overrides ",xterm*:Tc"

      # Reduce escape time
      set-option -g escape-time 0

      # Switch to next window on double C-Space
      bind C-Space next-window

      # hjkl pane traversal
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Set active pane border color
      set-option -wg pane-border-lines heavy
      set-option -wg pane-border-style fg=${base01},bg=${base01}
      set-option -wg pane-active-border-style fg=${base07},bg=${base01}

      # Resize panes with Ctrl+hjkl
      bind-key -r C-h resize-pane -L
      bind-key -r C-j resize-pane -D
      bind-key -r C-k resize-pane -U
      bind-key -r C-l resize-pane -R
    '';
  };
}
