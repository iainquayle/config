{...}: {
  services.prosody = {
    enable = true;

    # VPN-only: don't require TLS
    c2sRequireEncryption = false;
    s2sRequireEncryption = false;

    # don't run s2s federation (single-server on the VPN)
    extraConfig = ''
      s2s_secure_auth = false
    '';

    admins = [ "operator@strix.netbird.cloud" ];

    virtualHosts."strix.netbird.cloud" = {
      domain = "strix.netbird.cloud";
      enabled = true;
    };

    # group chat (MUC, XEP-0045)
    muc = [
      { domain = "muc.strix.netbird.cloud"; }
    ];

    # file sharing (HTTP file share, XEP-0363) — serves over HTTP port 5280
    httpFileShare = {
      domain = "upload.strix.netbird.cloud";
    };
  };
}
