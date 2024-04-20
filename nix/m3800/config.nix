{ config, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_6; 
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    #extraPackages = [ pkgs.amdvlk ];
    #extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
  };

  #environment.systemPackages = with pkgs; [ ];

  hardware.nvidia.prime = {
    sync.enable = true;
    #offload = {
    #  enable = true;
    #  enableOffloadCmd = true;
    #};
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";
  };
}
