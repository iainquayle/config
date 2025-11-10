{pkgs, ...}:
{
  # may want to figure out how to make a package for the ibkr gateway
  environment.systemPackages = with pkgs; [
    jre_minimal
  ];
}
