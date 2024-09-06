{ ... }: {
  # Enable systemd-resolved
  services.resolved.enable = true;

  services.cloudflare-warp.enable = true;
}
