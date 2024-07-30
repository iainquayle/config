{pkgs, ...}: {
  programs = {
    hyprland = {
      enable = true;
      #enableNvidiaPatches = true;
      xwayland.enable = true;
    };
    waybar = {
      enable = true;
      #package = pkgs.waybar.overrideAttrs (oldAttrs: {
      #  mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      #});
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    #WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))

    dunst
    libnotify
    rofi-wayland

    nwg-look 
    hyprpaper
    brightnessctl
  ];


  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override {fonts = [ "NerdFontsSymbolsOnly" ];})
  ];
}
