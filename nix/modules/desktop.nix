{pkgs, ...}: {
  programs = {
    chromium.enable = false;
    kdeconnect.enable = true;
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    #vieb
    qutebrowser

    alacritty
    kitty

    freecad
    renderdoc

    ncspot # this should be elsewhere?

    mpv # media player
    imv # image viewer

    pcmanfm # file manager

    pwvucontrol # pipewire gui
    iwgtk # iwd gui
  ];

  services.blueman.enable = true; # bluetooth gui

  fonts.packages = with pkgs; [
    font-awesome
    meslo-lgs-nf
  ];
}
