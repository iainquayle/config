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

  #need to check if anything below will cause issues between the two desktops
  #maybe try to move any of that to inits
  #services.xserver = {
  #  enable = true;
    #will need to make an init rc for this
  #  displayManager.startx.enable = true;
  #  desktopManager.lxqt.enable = true;
  #};

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

    dunst
    libnotify
    rofi-wayland

    alacritty
    wl-clipboard 

    hyprpaper
    hyprcursor
    nwg-look 
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    meslo-lgs-nf
    #font-awesome
    #powerline-fonts
    #powerline-symbols
    #(nerdfonts.override {fonts = [ "MesloNerdFont" "MesloNerdFontP10k" ];})
  ];
}
