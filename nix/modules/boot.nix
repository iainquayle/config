{ pkgs, ... }: {
  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_6_6; 
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}
