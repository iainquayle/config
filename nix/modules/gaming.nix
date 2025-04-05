{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    discord

    #look at removing or replacing with something else
    wlr-randr 
    xorg.xrandr

    ludusavi # game save backup tool
  ];

  environment.sessionVariables = { };
}
