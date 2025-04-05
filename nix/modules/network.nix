{...}: {
  networking = {
    hostName = "idfk";
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
