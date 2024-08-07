{ config, ... }: {
  imports = [
    ./modules/standard.nix
    ./modules/programs.nix
    ./modules/desktop.nix
    ./modules/sound.nix
    ./modules/wireless.nix
    ./modules/development.nix
    ./modules/nvidia.nix
    ./modules/gaming.nix
    ./modules/laptop.nix
    ./modules/vial_unsecure.nix
  ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
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
