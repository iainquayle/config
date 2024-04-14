{pkgs, ...}:
{
  programs = {
    hyprland = {
      enable = true;
	  enableNvidiaPatches = true;
      xwayland.enable = true;
    };
	waybar = {
      enable = true;
	  package = pkgs.waybar.overrideAttrs (oldAttrs: {
	    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
	};
  };

  environment.sessionVariables = {
    #WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
	dunst
	libnotify
	rofi-wayland
	kitty
  ];

/*
  services = {
    picom = {
      enable = true;
      shadow = true;
      fade = true;
      fadeDelta = 8;
      settings = {
        blur = {
          #method = "kernel";
          #kern = "7,7,7";
          #backend = "xrender";
          #method = "dual_kawase";
          #strength = 5;
          #backend = "glx";
        };
        corner-radius = 0;
      };
    };
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      xkbOptions = "caps:escape";
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          rofi
          i3status
          i3lock
        ];
        package = pkgs.i3-gaps;
      };
      desktopManager = {
        xterm.enable = false;
        xfce.enable = false;
      };
      displayManager = {
        defaultSession = "none+i3";
      };
    };
    printing.enable = true;
  };
*/
}
