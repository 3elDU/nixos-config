{ pkgs, ... }: {
  home.sessionVariables = {
    SWITCH_SCREENSHOT_DIR = "/home/ptflp/pic/switch";
  };

  # A script to copy screenshots from my nintendo switch connected via USB C cable
  home.packages = [
    (pkgs.writeShellScriptBin "copy-switch-screenshots" ''
      TEMPDIR=$(mktemp -d)
      ${pkgs.simple-mtpfs}/bin/simple-mtpfs $TEMPDIR || die

      [ -d $SWITCH_SCREENSHOT_DIR ] || mkdir $SWITCH_SCREENSHOT_DIR
      ${pkgs.rsync}/bin/rsync -av --ignore-existing $TEMPDIR $SWITCH_SCREENSHOT_DIR

      umount $TEMPDIR
      rm -d $TEMPDIR
    '')
  ];
}
