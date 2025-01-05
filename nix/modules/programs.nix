{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    freecad

    ncspot
    firefox
    #nyxt
    mpv 
  ];
}
