{pkgs, ...}:
{
  services = {
    samba = {
      enable = true;
      #securityType = "";
      #openFirewall = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";
          "hosts allow" = "100.65.0.0/16 127.0.0.1 localhost"; # need to add machines netbird addr 
          # supposedly I can have a line hosts allow += addr, which could be used for machine specific?
          "hosts deny" = "ALL";
          "guest account" = "pubsambauser";
          "map to guest" = "Bad User";
          "server min protocol" = "SMB2_10";
          "load printers" = "no";
          "printcap name" = "/dev/null";
        };
        public = {
          "path" = "/mnt/share/public";
          "browsable" = "yes";
          "read only" = "no";
          "guest ok" = "yes";
          "guest only" = "yes";
          "create mask" = "0644";
          "directory mask" = "0775";
          "force user" = "pubsambauser";
          "force group" = "pubsambagroup";
          #"vfs objects" = "acl_xattr full_audit"; # helps windows store more metadata
        };
      };
    };
    #samba-wsdd = {
    #  enable = true;
    #  openFirewall = true;
    #};
  };
  users = {
    users."pubsambauser" = {
      description = "public samba user";
      uid = 2000;
      isSystemUser = true;
      shell = "/sbin/nologin"; 
      group = "pubsambagroup";
      extraGroups = [ "pubsambagroup" ];
    };
    groups."pubsambagroup" = {
      gid = 2000;
    };
  };
  # either need to setup a auto systemd tempfile
  # or, setup auto mount for a disk to a certain path
  systemd.tmpfiles.rules = [
    "d /mnt/share/public 0755 pubsambauser pubsambagroup - -"
  ];
}

# if wanting to make a partition like system
# look at making a fixed size file, and formatting it as a file system
