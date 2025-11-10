{ config, ... }: {
  imports = [
    ./modules/audio.nix
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
    ./modules/ibkr.nix
  ];
  
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
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
      virtualHosts."http://strix.netbird.cloud:21338" = {
        extraConfig = ''
          respond "hello from netbird" 
        '';
      };
      virtualHosts."http://localhost:21338" = {
        extraConfig = ''
          respond "hello from local" 
        '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 21338 21339 ];
}
