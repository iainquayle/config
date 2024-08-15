{pkgs, ...}: {
  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  environment.systemPackages = with pkgs; [
    git

    nnn    
    superfile

    xclip
    tmux

    unzip
    psmisc

    zenith-nvidia
    fastfetch
  ];
}
