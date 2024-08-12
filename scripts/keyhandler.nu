#! /usr/bin/env nu

# keyhandler.nu
# Handles function key presses, controls brightness, volume, etc.
# Shows the value in wob

# brightness reported by brightnessctl is not in percents,
# but in some arbitrary scale, so get the max value
# to be able to compute current brightness, in percents
let max_brightness = brightnessctl max | into int

# Nushell is for some reason stupid,
# and writing to a FIFO socket just doesn't work,
# so we call zsh to write into it
def write_to_wob_pipe [
  text: string
] {
  zsh -c $"echo \"($text)\" > ($env.XDG_RUNTIME_DIR)/wob.sock"
}

def control_brightness [
  action # inc / dec
  amount: int
] {
  mut arg = ''

  match $action {
    "inc" => { $arg = $"+($amount)%" },
    "dec" => { $arg = $"($amount)%-" },
  }

  brightnessctl set $arg

  let current_brightness = (brightnessctl get | into int) / $max_brightness * 100 | math round;
  write_to_wob_pipe $"($current_brightness) brightness"
}

def control_volume [
  device # speakers / mic
  action # inc / dec / mute
  amount: int
] {
  mut wpctl_action = ''
  match $action {
    "inc" | "dec" => { $wpctl_action = "set-volume" },
    "mute" => { $wpctl_action = "set-mute" },
  }

  mut wpctl_sink = ''
  match $device {
    "speakers" => { $wpctl_sink = "@DEFAULT_AUDIO_SINK@" },
    "mic" => { $wpctl_sink = "@DEFAULT_AUDIO_SOURCE@" },
  }

  mut arg = ''
  match $action {
    "inc" => { $arg = $"($amount)%+" },
    "dec" => { $arg = $"($amount)%-" },
    "mute" => { $arg = "toggle" }
  }

  wpctl $wpctl_action $wpctl_sink $arg

  let muted = wpctl get-volume $wpctl_sink | str contains MUTED
  let volume = (wpctl get-volume $wpctl_sink | split row " " | get 1 | into float) * 100 | math round

  write_to_wob_pipe (($volume | into string) + (if $muted { " muted" } else ""))
}

def main [
  whatToControl # brightness / volume / mic
  action # inc / dec / mute (only for volume)
  amount: int = 0 # in percents
] {
  match $whatToControl {
    "brightness" => { control_brightness $action $amount },
    "volume" => { control_volume "speakers" $action $amount },
    "mic" => { control_volume "mic" $action $amount },
    _ => { print "Invalid option" }
  }
}
