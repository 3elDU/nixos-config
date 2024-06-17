{ inputs, pkgs, ... }: let
  # monospace = pkgs.nerdfonts.override { fonts = ["CascadiaCode"]; };
  monospace = pkgs.cascadia-code;
  monospaceName = "Cascadia Code NF";
in {
  stylix.enable = true;

  stylix.polarity = "dark";
  # This isn't used as we specify the base16 colorscheme manually
  # The background in sway is also overriden to be a solid color instead
  stylix.image = ../../wallpapers/anders-jilden-cYrMQA7a3Wc-unsplash.jpg;

  stylix.base16Scheme = "${inputs.cattpuccin-base16}/base16/macchiato.yaml";

  fonts.packages = [
    monospace
  ];
  # Enable ss01 stylesheet for Cascadia Code,
  # which enables alternative style for letters flrs
  # in italic
  # Example is taken from https://wiki.archlinux.org/title/Font_configuration/Examples#Alternate_stylistic_sets_for_fonts
  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>
      <match target="font">
        <test name="fontformat" compare="not_eq">
          <string />
        </test>
        <test name="family">
          <string>Cascadia Code NF</string>
        </test>
        <edit name="fontfeatures" mode="assign_replace">
          <string>ss01</string>
        </edit>
      </match>
    </fontconfig>
  '';
  stylix.fonts = let
    font = {
      package = monospace;
      name = monospaceName;
    };
  in {
    serif = font;
    sansSerif = font;
    monospace = font;

    sizes = {
      desktop = 12;
      popups = 12;
    };
  };
}
