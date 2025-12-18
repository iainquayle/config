# kept seperate from standard in case of specific boot requirements

{ pkgs, ... }: {
  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      #"v4l2loopback"
    ]; # maybe can remove networkmanager?
  };

  boot = { #is this the best setup?
    kernelPackages = pkgs.linuxPackages_zen; 
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}
