{ _prefs, pkgs, config, ... }: let
  left = "h";
  right = "l";
  up = "k";
  down = "j";

  mod = "Mod4";
  menu = "${pkgs.wofi}/bin/wofi";
  term = "${pkgs.kitty}/bin/kitty";
in {
  home = if _prefs.enableSway then {
    packages = [
      # Different keyboard layout for each window
      pkgs.swaykbdd 
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # https://nixos.wiki/wiki/Wayland
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  } else {};

  wayland.windowManager.sway = {
    enable = _prefs.enableSway;
    package = pkgs.swayfx;

    wrapperFeatures.gtk = true;
    xwayland = true;
    systemd.xdgAutostart = true;

    # A temporary fix for https://github.com/nix-community/home-manager/issues/5379
    checkConfig = false;

    config = {
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
      # Wrap around focus in the workspace
      focus.wrapping = "yes";

      window.border = 0;
      floating.border = 2;

      # Disable titlebar for all windows
      window.titlebar = false;
      floating.titlebar = false;

      input = {
        "type:touchpad" = {
          dwt = "disabled";
          tap = "enabled";
          click_method = "clickfinger";
          pointer_accel = "0.4";
          scroll_factor = "0.5";
        };
        "type:keyboard" = {
          xkb_layout = "us,ua,ru";
          xkb_options = "grp:caps_toggle";
        };
      };
      output = {
        "*" = {
          background = "${config.lib.stylix.colors.withHashtag.base00} solid_color";
        };
        eDP-1 = {
          scale = "1.25";
        };
      };

      keybindings = {
        # Start terminal
        "${mod}+Return" = "exec ${term}";
        # Start file manager
        "${mod}+Alt+e" = "exec ${pkgs.gnome.nautilus}/bin/nautilus";
        # Start launcher
        "${mod}+x" = "exec ${menu}";

        # Switch to US / UA / RU keyboard layout
        "Alt+1" = "exec swaymsg input \"type:keyboard\" xkb_switch_layout 0";
        "Alt+2" = "exec swaymsg input \"type:keyboard\" xkb_switch_layout 1";
        "Alt+3" = "exec swaymsg input \"type:keyboard\" xkb_switch_layout 2";

        # Kill focused window
        "${mod}+Shift+q" = "kill";

        # Screenshots
        "Print" = "exec ${../../scripts/screenshot} --copy";
        "${mod}+Print" = "exec ${../../scripts/screenshot} --copy --select-area";
        "${mod}+Shift+s" = "exec ${../../scripts/screenshot} --copy --select-area";

        # Volume control
        "XF86AudioRaiseVolume" = "exec ${pkgs.avizo}/bin/volumectl -d -u up";
        "XF86AudioLowerVolume" = "exec ${pkgs.avizo}/bin/volumectl -d -u down";
        # Volume control for microphone
        "Shift+XF86AudioRaiseVolume" = "exec ${pkgs.avizo}/bin/volumectl -d -m -u up";
        "Shift+XF86AudioLowerVolume" = "exec ${pkgs.avizo}/bin/volumectl -d -m -u down";
        "XF86AudioMute" = "exec ${pkgs.avizo}/bin/volumectl -d toggle-mute";
        "XF86AudioMicMute" = "exec ${pkgs.avizo}/bin/volumectl -d -m toggle-mute";

        # Brightness control
        "XF86MonBrightnessUp" = "exec ${pkgs.avizo}/bin/lightctl -d up";
        "XF86MonBrightnessDown" = "exec ${pkgs.avizo}/bin/lightctl -d down";

        # Reload sway configuration file
        "${mod}+Shift+c" = "reload";
        # Exit sway
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        # Move focus around
        "${mod}+${left}" = "focus left";
        "${mod}+${right}" = "focus right";
        "${mod}+${up}" = "focus up";
        "${mod}+${down}" = "focus down";
        # Move the focused window around
        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${right}" = "move right";
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${down}" = "move down";

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
        { command = "${pkgs.mako}/bin/mako"; }
        { command = "${pkgs.swaykbdd}/bin/swaykbdd"; }
      ];
    };

    extraConfig = ''
      # SwayFX-specific settings

      # Enable shadows for various top-level programs
      layer_effects wofi shadows enable

      # Move between workspaces with left-right 3-finger swipes
      bindgesture swipe:3:left workspace prev
      bindgesture swipe:3:right workspace next
      # Move between windows with up-down 3-finter swipes
      bindgesture swipe:3:up focus left
      bindgesture swipe:3:down focus right

      # Dim inactive windows a bit
      default_dim_inactive 0.25
    '';
  };

  programs.swaylock.enable = true;
}
