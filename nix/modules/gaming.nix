{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    discord

    wlr-randr
    xorg.xrandr

    ludusavi
  ];

  environment.sessionVariables = { };
}
