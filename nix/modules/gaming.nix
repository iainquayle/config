{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = false;
    };
  };

  environment.systemPackages = with pkgs; [
    discord

    wlr-randr
    xorg.xrandr
  ];

  environment.sessionVariables = { };
}
