# kept seperate from standard in case of specific boot requirements

{ pkgs, ... }: {
  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "video"
      "render"
      #"v4l2loopback"
    ]; # maybe can remove networkmanager?
  };

  boot = { #is this the best setup?
    #kernelPackages = pkgs.linuxPackages_zen; 
    #kernelPackages = pkgs.linuxPackages_6_18; 
    kernelPackages = pkgs.linuxPackages_6_12; 
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}
