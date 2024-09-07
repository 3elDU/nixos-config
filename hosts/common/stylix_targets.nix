# This is just a file enabling stylix targets that I need
{ ... }:
let
  globalTargets = [
    "console"
    "gtk"
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
      globalTargets);
}
