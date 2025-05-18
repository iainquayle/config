{pkgs, ...}: {
  programs = {
    kdeconnect.enable = true;
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    kitty

    freecad
    renderdoc

    ncspot
    #nyxt

    mpv # media player
    imv # image viewer

    pcmanfm # file manager

    pwvucontrol # pipewire gui
    iwgtk # iwd gui
  ];
  services.blueman.enable = true; # bluetooth gui

  fonts.packages = with pkgs; [
    # may want to add awesome font back in
    font-awesome
    meslo-lgs-nf
    #(nerdfonts.override {fonts = [ "MesloNerdFont" "MesloNerdFontP10k" ];})
  ];
}
