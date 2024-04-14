{pkgs, ...}:
{
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
}
