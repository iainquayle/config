{ config, ... }: {
  imports = [
	./modules/standard.nix
	./modules/programs.nix
	./modules/desktop.nix
	./modules/sound.nix
	./modules/wireless.nix
	./modules/development.nix
	./modules/nvidia.nix
	./modules/laptop.nix
  ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    prime = {
	  sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";
    };
  };
}
