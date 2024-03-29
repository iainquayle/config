{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_6_6; #6 1 hangs on shutdown

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  #environment.systemPackages = with pkgs; [ ];


  hardware.nvidia.prime = {
    #sync.enable = true;
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    intelBusId = "PCI:5:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
