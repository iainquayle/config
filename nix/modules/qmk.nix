#rename this file?
{pkgs, ... }: {
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [
    vial
    via
  ];
  services.udev.packages = with pkgs; [
    vial 
    via
  ];
}
