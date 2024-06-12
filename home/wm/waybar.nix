{ enableSway, colorscheme, lib, pkgs, ... }: {
  programs.waybar = {
    enable = enableSway;

    settings = [{
      modules-left = ["sway/workspaces" "sway/mode" "sway/scratchpad" "sway/window"];
      modules-center = [];
      modules-right = ["privacy" "pulseaudio" "network" "bluetooth" "cpu" "memory" "temperature" "sway/language" "battery" "clock" "tray"];

      "sway/mode" = {
        format = "󰖲 {}";
      };
      "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = ["" ""];
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
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
      };
      network = {
        format-wifi = "{icon}";
        tooltip-format-wifi = "{ipaddr} on {essid}, {signalStrength}% strength";
        format-icons = [
          "󰤟"
          "󰤢"
          "󰤥"
          "󰤨"
        ];
        format-ethernet = "";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "󰀝";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      bluetooth = {
        format = "󰂯";
        format-disabled = "󰂲";
        format-off = "󰂲";
        format-connected = "󰂱";
        tooltip-format = ''
          Status: {status}
          Connected devices:
          {device_enumerate}
        '';
        on-click = "${pkgs.blueman}/bin/blueman-manager";
      };
      cpu = {
          format = "{usage}% 󰍛";
          interval = 1;
      };
      memory = {
          format = "{}% 󰘚";
          tooltip-format = "Used: {used}GiB\nSwap used: {swapUsed}GiB\n\nAvailable: {avail}GiB\nTotal: {total}GiB";
          interval = 5;
      };
      temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
          interval = 5;
      };
      "sway/language" = {
        format = "󰌌 {short}";
      };
      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        tooltip-format = "{capacity}%\n{power}W power draw\n{timeTo}";
        format = "{capacity}% {icon}";
        format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% 󰂄";
        format-plugged = "{capacity}% 󰚥";
        format-alt = "{time} {icon}";
        format-icons = ["" "" "" "" ""];
      };
      clock = {
        interval = 60;
        format = "{:%a %d.%m, %H:%M}";
        format-alt = "{:%a, %F, %T}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
      tray = { spacing = 10; };
    }];

    style =
      # Convert the colorscheme attribute set to GTK color declarations
      lib.strings.concatStrings(builtins.attrValues(
        builtins.mapAttrs (name: value: "@define-color ${name} ${value.hex};\n") colorscheme
      ))
      +
      (builtins.readFile ../../configs/waybar/style.css);
  };
}
