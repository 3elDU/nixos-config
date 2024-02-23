{ pkgs, ... }: {
  programs.nushell = {
    enable = true;
    package = pkgs.nushellFull;
  };
  # External command completions used in nushell
  programs.carapace = {
    enable = true;
  };
}
