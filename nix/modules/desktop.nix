{pkgs, ...}: {
  programs = {
    kdeconnect.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty

    freecad
    renderdoc

    ncspot
    firefox
    #nyxt
    mpv 

    pwvucontrol
    iwgtk
  ];
  services.blueman.enable = true; 

  fonts.packages = with pkgs; [
    meslo-lgs-nf
    #(nerdfonts.override {fonts = [ "MesloNerdFont" "MesloNerdFontP10k" ];})
  ];
}
