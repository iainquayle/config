{ config, ... }: {
  imports = [
    ./modules/audio.nix
    ./modules/base.nix
    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/development.nix
    ./modules/gaming.nix
    ./modules/hyprland.nix
    ./modules/laptop.nix
    ./modules/network.nix
    ./modules/nvidia.nix
    ./modules/vial_unsecure.nix
  ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
