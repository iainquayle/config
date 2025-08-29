#
# YES, a simlink can accomplish this, i dont like hidden state 
#

{ ... }: {
  imports = [
    ./hardware-configuration.nix
    /home/iainq/.config/nix/strix17.nix
  ];

  system.stateVersion = "23.11"; #dont change
}
