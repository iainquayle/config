{pkgs, ...}: {
  programs = {
    kdeconnect.enable = true;
  };

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

  fonts.packages = with pkgs; [
    meslo-lgs-nf
    #(nerdfonts.override {fonts = [ "MesloNerdFont" "MesloNerdFontP10k" ];})
  ];
}
