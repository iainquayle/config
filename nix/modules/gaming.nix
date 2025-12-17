{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    #steamcontroller.enable = true;
    #gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    #discord
    #ludusavi # game save backup tool
    lutris
  ];

  environment.sessionVariables = { };

  environment.shellAliases = {
    #steam-gamescope = "gamescope -f -e -W 2560 -H 1440 -- steam -gamepadui"; 
    steam-gamescope = "gamescope -f -e -w 2560 -h 1440 -F fsr --hdr-enabled --adaptive-sync -- steam -gamepadui"; 
    # -O will specify display, -r will set refresh, 
    #--adaptive-sync will set variable refresh rate, --vsync for vsync
  };
}
