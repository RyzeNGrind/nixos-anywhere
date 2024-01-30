{ lib, ... }:

{
  disko.devices = {
    disk = {
      disk0 = {
        device = "/dev/disk/by-id/usb-Kingston_DataTraveler_70_D067E5164F91F5906604014B";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            sda = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/mnt/sda";
              };
            };
            swap = {
              size = "30G";
              content = {
                type = "swap";
              };
            };
          };
        };
      };
    };
    nvme = {
      nvme0n1 = {
        device = "/dev/disk/by-id/nvme-KINGSTON_SNVS2000G_50026B76855F4501";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}