# kept seperate from standard in case of specific boot requirements

{ pkgs, ... }: {
  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
    ]; # maybe can remove networkmanager?
  };

  boot = { #is this the best setup?
    kernelPackages = pkgs.linuxPackages_6_12; 
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}
