{ config, pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;

    config = let
      left = "h";
      right = "l";
      up = "k";
      down = "j";

      mod = "Mod4";
      menu = "${pkgs.wofi}/bin/wofi";
      term = "${pkgs.foot}/bin/foot";
    in {
      # Use --to-code with all keybindings, so that
      # They could be activated on any keyboard layout, not only on latin.
      bindkeysToCode = true;
      left = left;
      right = right;
      up = up;
      down = down;
      modifier = mod;
      menu = menu;
      terminal = term;
      workspaceAutoBackAndForth = true;

      colors = {
        focused = { border = "#d79921"; background = "#d79921"; text = "#282828"; indicator = "#d79921"; childBorder = "#d79921"; };
        urgent = { border = "#d79921"; background = "#cc241d"; text = "#282828"; indicator = "#cc241d"; childBorder = "#cc241d"; };
        focusedInactive = { border = "#3c3836"; background = "#282828"; text = "#fbf1c7"; indicator = "#282828"; childBorder = "#3c3836"; };
        unfocused = { border = "#d79921"; background = "#282828"; text = "#fbf1c7"; indicator = "#282828"; childBorder = "#282828"; };
      };

      fonts = {
        names = ["JetBrainsMono Nerd Font"];
        style = "Regular";
        size = 10.0;
      };

      gaps = {
        outer = 6;
        inner = 8;
      };

      input = {
        "type:touchpad" = {
          dwt = "disabled";
          tap = "enabled";
          click_method = "clickfinger";
          pointer_accel = "0.4";
        };
        "type:keyboard" = {
          xkb_layout = "us,ua,ru";
          xkb_options = "grp:caps_toggle";
        };
      };
      output = {
        "*" = {
          background = "${../../wallpapers/anders-jilden-cYrMQA7a3Wc-unsplash.jpg} stretch";
        };
      };

      keybindings = {
        # Start terminal
        "${mod}+Return" = "exec ${term}";
        # Start file manager
        "${mod}+Alt+e" = "exec ${pkgs.gnome.nautilus}/bin/nautilus";
        # Start launcher
        "${mod}+x" = "exec ${menu}";

        # Kill focused window
        "${mod}+Shift+q" = "kill";

        # Screenshots
        "Print" = "exec ${../../scripts/screenshot} --copy";
        "${mod}+Print" = "exec ${../../scripts/screenshot} --copy --select-area";

        # Volume control
        "XF86AudioRaiseVolume" = "exec ${pkgs.avizo}/bin/volumectl -u up";
        "XF86AudioLowerVolume" = "exec ${pkgs.avizo}/bin/volumectl -u down";
        # Volume control for microphone
        "Shift+XF86AudioRaiseVolume" = "exec ${pkgs.avizo}/bin/volumectl -m -u up";
        "Shift+XF86AudioLowerVolume" = "exec ${pkgs.avizo}/bin/volumectl -m -u down";
        "XF86AudioMute" = "exec ${pkgs.avizo}/bin/volumectl toggle-mute";
        "XF86AudioMicMute" = "exec ${pkgs.avizo}/bin/volumectl -m toggle-mute";

        # Brightness control
        "XF86MonBrightnessUp" = "exec ${pkgs.avizo}/bin/lightctl up";
        "XF86MonBrightnessDown" = "exec ${pkgs.avizo}/bin/lightctl down";

        # Reload sway configuration file
        "${mod}+Shift+c" = "reload";
        # Exit sway
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
        
        # Move focus around
        "${mod}+${left}" = "focus left";
        "${mod}+${right}" = "focus right";
        "${mod}+${up}" = "focus up";
        "${mod}+${down}" = "focus down";
        
        # Switch to workspace
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        # Move container to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";

        # Horizontal and vertical splits
        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";

        # Switch between layout styles
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        # Toggle fullscreen
        "${mod}+f" = "fullscreen";

        # Toggle floating mode for focused window
        "${mod}+Shift+space" = "floating toggle";
        # Toggle between floating and tiled windows
        "${mod}+space" = "focus mode_toggle";

        # Focus parent container
        "${mod}+a" = "focus parent";

        # Move window to scratchpad
        "${mod}+Shift+minus" = "move scratchpad";
        # Cycle between scratchpad windows
        "${mod}+minus" = "scratchpad show";

        "${mod}+r" = "mode resize";
      };

      modes = {
        resize = {
          "${left}" = "resize shrink width 10px";
          "${right}" = "resize grow width 10px";
          "${up}" = "resize shrink height 10px";
          "${down}" = "resize grow height 10px";

          Escape = "mode default";
          Return = "mode default";
          "${mod}+r" = "mode default";
        };
      };

      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];

      startup = [
        { command = "${pkgs.avizo}/bin/avizo-service"; }
        { command = "${pkgs.mako}/bin/mako"; }
      ];
    };

    extraConfig = ''
      # focused_tab_title class is not available in home-manager
      client.focused_tab_title #7c6f64 #282828 #fbf1c7 #282828 #3c3836

      # SwayFX settings
      blur enable
      shadows enable
      corner_radius 8
      smart_corner_radius enable
      # Enable background blur for wofi
      layer_effects "wofi" {
        blur enable
        shadows enable
      }
      # Enable background blur for avizo
      layer_effects "avizo" {
        blur enable
      }
    '';
  };

  programs.swaylock.enable = true;
}
