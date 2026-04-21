{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ente-auth 
    ente-cli
    #git-crypt
    age
  ];
}
