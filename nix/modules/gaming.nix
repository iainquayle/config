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
}
