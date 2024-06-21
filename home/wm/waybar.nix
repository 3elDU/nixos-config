{ _prefs, config, lib, pkgs, ... }:
let
  colorNames = [
    "base00"
    "base01"
    "base02"
    "base03"
    "base04"
    "base05"
    "base06"
    "base07"
    "base08"
    "base09"
    "base0A"
    "base0B"
    "base0C"
    "base0D"
    "base0E"
    "base0F"
  ];

  # Colors used in the markup
  colors = config.lib.stylix.colors.withHashtag;
  secondary = colors.${_prefs.secondaryColor};
  yellow = colors.base0A;
  peach = colors.base09;
  red = colors.base08;
  green = colors.base0B;

  defineColor = name: value: "@define-color ${name} ${value};";

  markup = color: text: "<span color=\"${color}\" style=\"oblique\">${text}</span>";
in
{
  # Stylix injects CSS that I do not want,
  # so we style waybar for ourselves
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = _prefs.enableSway;

    style = lib.strings.concatStringsSep "\n"
      (
        # Convert the colors attribute set to GTK color declarations
        builtins.map (color: defineColor color colors.${color}) colorNames
      )
    +
    # Append primary and secondary colors
    ''
      ${defineColor "primary" colors.${_prefs.primaryColor}}
      ${defineColor "secondary" colors.${_prefs.secondaryColor}}
    ''
    +
    # Append the main CSS file
    (builtins.readFile ../../configs/waybar/style.css)
    +
    # Use monospace font
    ''
      /* Font family injected by Nix */
      * {
        font-family: ${config.stylix.fonts.monospace.name};
      }
    '';

    settings = [{
      modules-left = [ "sway/workspaces" "sway/mode" "sway/scratchpad" "sway/window" ];
      modules-center = [ ];
      modules-right = [ "privacy" "pulseaudio" "network" "bluetooth" "cpu" "memory" "temperature" "sway/language" "battery" "clock" "tray" ];

      "sway/mode" = {
        format = "mode {}";
      };
      "sway/scratchpad" = {
        format = "scratchpad {count}";
        show-empty = false;
        format-icons = [ "" "" ];
        tooltip = true;
        tooltip-format = "Scratchpad\n{app}: {title}";
      };
      privacy = {
        modules = [
          { type = "screenshare"; }
          { type = "audio-in"; }
        ];
      };
      pulseaudio = {
        format = "{icon} {volume}% {format_source}";
        format-bluetooth = "${markup secondary "vol bt"} {volume}% {format_source}";
        format-bluetooth-muted = "${markup red "muted bt"} {format_source}";
        format-muted = "${markup red "muted"} {format_source}";
        format-source = "${markup secondary "mic"} {volume}%";
        format-source-muted = markup red "mic";
        format-icons = {
          headphone = "${markup secondary "vol"}";
          hands-free = "${markup secondary "handsfree"}";
          headset = "${markup secondary "headset"}";
          phone = "${markup secondary "phone"}";
          portable = "${markup secondary "portable"}";
          car = "${markup secondary "car"}";
          default = "${markup secondary "vol"}";
        };
        on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
      };
      network = {
        format-wifi = "${markup secondary "wlan"} {signalStrength}%";
        tooltip-format-wifi = "{ipaddr} on {essid}, {signalStrength}% strength";
        format-ethernet = "${markup secondary "eth"} conn";
        tooltip-format = "{ifname} via {gwaddr}";
        format-linked = markup red "eth no ip";
        format-disconnected = markup red "no internet";
        format-alt = "${markup secondary "{ifname}"}: {ipaddr}/{cidr}";
      };
      bluetooth = {
        format = "${markup secondary "bt"} on";
        format-disabled = "${markup secondary "bt"} off";
        format-off = "${markup secondary "bt"} off";
        format-connected = "${markup secondary "bt"} connected";
        tooltip-format = ''
          Status: {status}
          Connected devices:
          {device_enumerate}
        '';
        on-click = "${pkgs.blueman}/bin/blueman-manager";
      };
      cpu = {
        format = "{icon} {usage}%";
        format-icons = [
          (markup secondary "cpu")
        ];
        interval = 1;
      };
      memory = {
        format = "${markup secondary "mem"} {}%";
        format-icons = [
          (markup secondary "temp")
          (markup secondary "temp")
          (markup yellow "temp")
          (markup peach "temp")
          (markup red "temp")
        ];
        tooltip-format = "Used: {used}GiB\nSwap used: {swapUsed}GiB\n\nAvailable: {avail}GiB\nTotal: {total}GiB";
        interval = 5;
      };
      temperature = {
        critical-threshold = 80;
        format = "{icon} {temperatureC}°C";
        format-icons = [
          (markup secondary "temp") # 0-16
          (markup secondary "temp") # 16-32
          (markup secondary "temp") # 32-48
          (markup yellow "temp") # 48-64
          (markup red "temp") # 64-80
        ];
        interval = 5;
      };
      "sway/language" = {
        format = "${markup secondary "kbd"} {short}";
      };
      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        tooltip-format = "{capacity}%\n{power}W power draw\n{timeTo}";
        format = "{icon} {capacity}%";
        format-full = "{icon} {capacity}%";
        format-charging = "${markup green "charging"} {capacity}%";
        format-plugged = "{icon} {capacity}%";
        format-alt = "{time} {icon}";
        format-icons = [
          (markup red "bat") # 0-20%
          (markup peach "bat") # 20-40%
          (markup yellow "bat") # 40-60%
          (markup secondary "bat") # 60-80%
          (markup secondary "bat") # 80-100%
        ];
      };
      clock = {
        interval = 60;
        format = "${markup secondary "date"} {:%a %d.%m, %H:%M}";
        format-alt = "{:%a, %F, %T}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
      tray = { spacing = 10; };
    }];
  };
}
