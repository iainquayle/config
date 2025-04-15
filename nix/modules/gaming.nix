{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    discord

    ludusavi # game save backup tool
  ];

  environment.sessionVariables = { };
}
