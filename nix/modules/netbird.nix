{...}: {
  services = {
    netbird = {
      enable = true;
    };
    caddy = { # these should be moved to machine specific configs
      enable = true; # may move the enable to its own?
      virtualHosts."http://strix.netbird.cloud:21339" = {
        extraConfig = ''
          reverse_proxy http://localhost:11434 {
            header_up Host localhost:11434
          }
        '';
      };
      virtualHosts."http://strix.netbird.cloud:21338" = {
        extraConfig = ''
          respond "hello from strix" 
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
