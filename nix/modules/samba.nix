{...}:
{
  service = {
    samba = {
      enable = true;
      securityType = "";
      openFirewall = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "file share";
          "netbios name" = "smbnix";
          "security" = "user";
          "hosts allow" = "strix.netbird.cloud 127.0.0.1 localhost"; # need to add machines netbird addr 
          "hosts deny" = "0.0.0.0/0";
          "guest account" = "smb-user";
          "map to guest" = "bad user";
        };
        "public" = {
          "path" = "/mnt/share/public";
          "browsable" = "yes";
          "read only" = "no";
          "guest ok" = "yes";
          "create mask" = "0644";
          "directory mask" = "0775";
          "force user" = "";
          "force group" = "";
        };
      };
    };
    #samba-wsdd = {
    #  enable = true;
    #  openFirewall = true;
    #};
  };
  users = {
    users."smb-user" = {
      isSystemUser = true;
      shell = "/sbin/nologin";
      home = "";
      group = "";
    };
    groups."smb-group" = {};
  };
  # either need to setup a auto systemd tempfile
  # or, setup auto mount for a disk to a certain path
}
