{pkgs, ...}: {

  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  boot = {
    kernelPackages = pkgs.linuxPackages_6_6; 
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  environment.systemPackages = with pkgs; [
    git

    nnn    

    xclip
    tmux

    unzip
    psmisc

    zenith-nvidia
    fastfetch
  ];
}
