{ ... }: {
  # Disko module is imported in flake.nix

  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "f2fs";
                mountpoint = "/";
                mountOptions = [ "compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime" ];
                extraArgs = [ "-O" "extra_attr,inode_checksum,sb_checksum,encrypt,compression" ];
              };
            };
          };
        };
      };
    };
  };
}
