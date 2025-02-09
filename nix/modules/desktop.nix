{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alacritty

    freecad

    ncspot
    firefox
    #nyxt
    mpv 

    pwvucontrol
  ];
  services.blueman.enable = true; 
  networking.networkmanager.enable = true;

  fonts.packages = with pkgs; [
    meslo-lgs-nf
    #(nerdfonts.override {fonts = [ "MesloNerdFont" "MesloNerdFontP10k" ];})
  ];
}
