{...}: {
  sops = {
    age.keyFile = "/home/ptflp/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets/home.json;
  };
}
