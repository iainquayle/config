{...}: {
  networking = {
    wireless = {
      enable = false; #wpa_supplicant
      iwd = { #inet wireless daemon, intel resplacement for wpa_supplicant
        enable = true;
        settings = {
          IPv6 = {
            Enabled = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
    useNetworkd = true; # replaces NetworkManager
    #useDHCP = false; # may be able to hand this off to networkd?
    firewall = {
      enable = true;
      allowPing = true;
    };
  };
  systemd.network = {
    enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Local link multicast name resolution, not the same as mdns
  services.resolved.llmnr = "false"; 

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # services.openssh.enable = true;
}
