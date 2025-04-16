{pkgs, ...}: {
  programs = {
    kdeconnect.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    kitty

    freecad
    renderdoc

    ncspot
    firefox
    #nyxt

    mpv 
    imv

    pcmanfm

    pwvucontrol # pipewire gui
    iwgtk # iwd gui
  ];
  services.blueman.enable = true; # bluetooth gui

  fonts.packages = with pkgs; [
    # may want to add awesome font back in
    meslo-lgs-nf
    #(nerdfonts.override {fonts = [ "MesloNerdFont" "MesloNerdFontP10k" ];})
  ];
}
