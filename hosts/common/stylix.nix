{ inputs, pkgs, ... }: let
  monospace = pkgs.nerdfonts.override { fonts = ["CascadiaCode"]; };
in {
  stylix.enable = true;

  stylix.polarity = "dark";
  # This isn't used as we specify the base16 colorscheme manually
  stylix.image = ../../wallpapers/anders-jilden-cYrMQA7a3Wc-unsplash.jpg;

  stylix.base16Scheme = "${inputs.cattpuccin-base16}/base16/macchiato.yaml";

  environment.systemPackages = [
    pkgs.cascadia-code
    monospace
  ];
  stylix.fonts = let
    font = {
      package = monospace;
      name = "CaskaydiaCove Nerd Font";
    };
  in {
    serif = font;
    sansSerif = font;
    monospace = font;

    sizes = {
      popups = 12;
    };
  };
}
