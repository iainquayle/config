#turn this into a shell instead of a module
{pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vial
    via
  ];
  services.udev.packages = with pkgs; [
    vial 
    via
  ];
}
