{pkgs, ...}: {
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar = {
      enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    #WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1"; #may cause issues with other servers... may not need this anymore anyway
  };

  environment.systemPackages = with pkgs; [
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))

    #for some reason, this is not working with hyprland
    #see if with niri maybe it will work, or make our own system that switches based on the session
    #wlr-randr #wayland output cli
    #kanshi #wayland output auto config

    dunst # notification daemon
    libnotify # notification library
    rofi-wayland

    wl-clipboard 

    hyprpaper
    hyprcursor
    #nwg-look 

    #perhaps should be moved somewhere else? not specific to hyprland/wayland
    brightnessctl 
  ];

  environment.shellAliases = {
    monitors-home = "hyprctl keyword monitor DP-2,preferred,auto,1,transform,3";
  };
}
