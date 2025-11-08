{...}:
{
  service = {
    samba = {
      enable = true;
      securityType = "";
      openFirewall = true;
      settings = {
        global = {
          "workgroup" = "";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";
          "hosts allow" = "127.0.0.1 localhost"; # need to add machines netbird addr 
          "hosts deny" = "0.0.0.0/0";
          "guest account" = "";
        };
      };
    };
    #samba-wsdd = {
    #  enable = true;
    #  openFirewall = true;
    #};
  };
}
