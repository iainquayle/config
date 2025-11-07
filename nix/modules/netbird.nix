{...}: {
  services = {
    netbird = {
      enable = true;
    };
    caddy = { 
      enable = true; # may move the enable to its own?
      virtualHosts."100.65.64.248:21338" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:11434
        '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 21338 ];
}
