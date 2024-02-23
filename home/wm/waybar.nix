{ pkgs, ... }: {
  programs.waybar = {
    enable = true;

    settings = {
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
              activated = "",;
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
    };

    style = 
    ''
    * {
      all: unset;
      min-height: 32px;
      font-family: JetBrainsMono Nerd Font Propo;
    }

    window#waybar {
      min-height: 24px;

      border: none;
      border-radius: 0;

      background: transparent;
      color: #fbf1c7;
    }

#scratchpad, #mode, #idle_inhibitor, #pulseaudio, #network, #bluetooth, #cpu, #memory, #temperature, #keyboard_state, #language, #battery, #tray {
      min-width: 32px;
      background-color: #282828;
      padding: 0 8px;
      margin: 0 4px;
      border-radius: 8px;
    }

    tooltip {
      background: #282828;
      border: 2px solid #d79921;
      border-radius: 8px;
    }

#workspaces {
      padding: 4px;
      margin-right: 4px;
      border-radius: 8px;
      background: #282828;
    }
#workspaces button {
      transition: background-color 150ms ease-in-out, color 150ms ease-in-out;

      min-width: 48px;
      border-radius: 4px;
      
      margin-right: 4px;
    }
#workspaces button:last-child {
      margin-right: 0;
    }
#workspaces button:not(.focused) {
      color: #928374;
    }
#workspaces button.focused {
      background: #d79921;
      color: #282828;
      font-weight: bold;

    }
#workspaces button.urgent {
      color: #fbf1c7;
      background: #cc241d;
      font-weight: bold;
    }

#mode {
      background: #cc241d;
      color: #fbf1c7;
      font-weight: bold;
    }

#scratchpad {
      padding: 0 16px;
      border-radius: 8px;
      background: #d65d0e;
    }

#window {
      margin-left: 16px;
      text-shadow: 0px 0px 4px black;
    }

#clock {
      margin: 0 64px;
      padding: 0 16px;
      background: #282828;
      border-radius: 8px;
      font-weight: 500;
    }

#network {
      border-radius: 8px 0 0 8px;
      margin-right: 0;
      border-right: 1px solid #504945;
    }
#bluetooth {
      border-radius: 0 8px 8px 0;
      margin-left: 0;
    }

#cpu {
      margin-right: 0;
      border-radius: 8px 0 0 8px;
      padding-right: 12px;
    }
#memory {
      margin: 0;
      padding: 0 12px;
      border-radius: 0;
      border: 1px solid #504945;
      border-top: none;
      border-bottom: none;
    }
#temperature {
      padding-left: 12px;
      margin-left: 0;
      border-radius: 0 8px 8px 0;
    }
#temperature.critical {
      background: #cc241d;
      font-weight: bold;
    }

#battery.Charging {
      background: #98971a;
      font-weight: bold;
    }
#battery.warning {
      background: #d79921;
      font-weight: bold;
    }
#battery.critical {
      background: #cc241d;
      font-weight: bold;
    }

#tray menu {
      background: #282828;
      border: 2px solid #d79921;
      border-radius: 8px;
    }
#tray menu > * {
      padding: 0 16px;
    }
#tray menu > :hover {
      background: #d79921;
      color: #282828;
      font-weight: bold;
    }
    /* Round the corners for first and last item in the menu, so that it won't visually overflow the menu window */
#tray menu > :first-child:hover {
      border-radius: 8px 8px 0 0;
    }
#tray menu > :last-child:hover {
      border-radius: 0 0 8px 8px;
    }
    '';
  };
}
