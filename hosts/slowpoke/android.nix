{ ... }: {
  # For android development

  programs.adb.enable = true;
  users.users.ptflp.extraGroups = [
    "adbusers"
  ];
}
