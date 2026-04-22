{...}: {
  services.webdav = {
    enable = true;
    user = "fileshare";
    group = "fileshare";
    settings = {
      address = "127.0.0.1"; 
      port = 6065;
      directory = "/mnt/share/public";
      permissions = "CRUD";
    };
  };

  users.users."fileshare" = {
    description = "file share user";
    uid = 2000;
    isSystemUser = true;
    shell = "/sbin/nologin";
    group = "fileshare";
  };

  users.groups."fileshare" = {
    gid = 2000;
  };

  systemd.tmpfiles.rules = [
    "d /mnt/share/public 0775 fileshare fileshare - -"
  ];
}
