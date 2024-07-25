{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    freecad
    libreoffice-still

    ncspot
    firefox
    nyxt
    vlc
  ];
}
