{ config, ... }: {
  imports = [
    ./modules/audio.nix
    ./modules/auth.nix
    ./modules/base.nix
    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/development.nix
    ./modules/gaming.nix
    ./modules/wayland-wms.nix
    ./modules/laptop.nix
    ./modules/network.nix
    ./modules/nvidia.nix
    ./modules/qmk.nix
    ./modules/stream.nix
    ./modules/ollama.nix
    ./modules/netbird.nix
    ./modules/trading.nix
    ./modules/file-share.nix
    ./modules/can.nix
    ./modules/security.nix
    ./modules/cad.nix
  ];
  
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    #package = config.boot.kernelPackages.nvidiaPackages.beta;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  networking.hostName = "strix";

  services = {
    caddy = { 
      enable = true; 
      virtualHosts."http://strix.netbird.cloud:21339" = {
        extraConfig = ''
          reverse_proxy http://localhost:11434 {
            header_up Host localhost:11434
          }
        '';
      };
      virtualHosts."http://strix.netbird.cloud:21340" = {
        extraConfig = ''
          reverse_proxy http://localhost:6065 {
            header_up Host localhost:6065
          }
        '';
      };
      virtualHosts."http://strix.netbird.cloud:21338" = {
        extraConfig = ''
          respond "Hello from Caddy to Netbird" 
        '';
      };
      virtualHosts."http://localhost:21338" = {
        extraConfig = ''
          respond "Hello from Caddy to Local" 
        '';
      };
    };
  };
  networking.firewall.extraInputRules = ''
    # WebDAV and ollama restrictions.
    ip saddr 100.65.0.0/16 tcp dport { 21338, 21339, 21340 } accept

    # KDE connect restrictions
    ip saddr { 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 } tcp dport 1714-1764 accept
    ip saddr { 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 } udp dport 1714-1764 accept
    ip saddr 100.65.0.0/16 tcp dport 1714-1764 accept 
    ip saddr 100.65.0.0/16 udp dport 1714-1764 accept
  '';
}
