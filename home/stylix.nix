{ ... }:
let
  homeManagerTargets = [
    "alacritty"
    "btop"
    "dunst"
    "firefox"
    "foot"
    "gtk"
    "kitty"
    "lazygit"
    "mako"
    "neovim"
    "nushell"
    "tmux"
    "vscode"
  ];
in
{
  stylix.targets = builtins.listToAttrs
    (builtins.map
      (target: {
        name = target;
        value = {
          enable = true;
        };
      })
      homeManagerTargets);
}
