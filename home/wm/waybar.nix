{ pkgs, ... }: {
  programs.waybar = {
    enable = true;

    settings = [{
      margin = "8 16 0 16";

      modules-left = ["sway/workspaces" "sway/mode" "sway/scratchpad" "sway/window"];
      modules-center = ["clock"];
      modules-right = ["idle_inhibitor" "pulseaudio" "network" "bluetooth" "cpu" "memory" "temperature" "sway/language" "battery" "tray"];

      keyboard-state = {
        numlock = true;
        capslock = true;
        format = "{name} {icon}";
        format-icons = {
          locked = "";
          unlocked = "";
        };
      };
      "sway/mode" = {
        format = "󰖲 {}";
      };
      "sway/language" = {
        format = "󰌌 {short}";
      };
      "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = ["" ""];
          tooltip = true;
          tooltip-format = "Scratchpad\n{app}: {title}";
      };
      idle_inhibitor = {
          format = "{icon}";
          format-icons = {
              activated = "";
              deactivated = "";
          };
      };
      tray = { spacing = 10; };
      clock = {
        interval = 1;
        format = " {:%H:%M:%S %F}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };
      cpu = {
          format = "{usage}% 󰍛";
      };
      memory = {
          format = "{}% 󰘚";
          tooltip-format = "Used: {used}GiB\nSwap used: {swapUsed}GiB\n\nAvailable: {avail}GiB\nTotal: {total}GiB";
      };
      temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
      };
      backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
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
      network = {
        format-wifi = "{icon}";
        tooltip-format-wifi = "{ipaddr} on {essid}, {signalStrength}% strength";
        format-icons = [
          "󰤟"
          "󰤢"
          "󰤥"
          "󰤨"
        ];
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      bluetooth = {
        format = "󰂯";
        format-disabled = "󰂲 Disabled";
        format-off = "󰂲 Off";
        format-connected = "󰂱 Connected";
        tooltip-format = "Status: {status}";
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
    }];

    style = ../../configs/waybar/style.css;
  };
}
