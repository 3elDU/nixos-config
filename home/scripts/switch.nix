{ pkgs }: {
  home.sessionVariables = {
    SWITCH_SCREENSHOT_DIR = "~/pic/switch";
  };

  # A script to copy screenshots from my nintendo switch connected via USB C cable
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "copy-switch-screenshots" ''
      TEMPDIR=$(mktemp -d)
      ${pkgs.mptfs}/bin/mtpfs $TEMPDIR

      [ -d $SWITCH_SCREENSHOT_DIR ] || mkdir $SWITCH_SCREENSHOT_DIR
      cp -v -u=none $TEMPDIR $SWITCH_SCREENSHOT_DIR

      umount $TEMPDIR
      rm -d $TEMPDIR
    '')
  ];
}
