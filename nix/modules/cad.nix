{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    freecad
    f3d
  ];
}
