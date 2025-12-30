{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    #gamescope = {
    #  enable = true;
    #  capSysNice = true;
    #};
    #steamcontroller.enable = true;
    #gamemode.enable = true;
  };
  #services.seatd.enable = true;

  environment.systemPackages = with pkgs; [
    #discord
    #ludusavi # game save backup tool
    #lutris
  ];

  environment.sessionVariables = { };

  environment.shellAliases = {
    #steam-gamescope = "gamescope -f -e -W 2560 -H 1440 -- steam -gamepadui"; 
    steam-gamescope = ''gamescope -f -e -w 2560 -h 1440 --rt --adaptive-sync -- steam -gamepadui --disable-overlay-gpu-pri''; 
    # --mangoapp
    # LD_PRELOAD=""
    # ENABLE_GAMESCOPE_WSI=0
    # --hdr-enabled
    # --adaptive-sync
    # -O will specify display, -r will set refresh, 
    #--adaptive-sync will set variable refresh rate, --vsync for vsync
  };
}
