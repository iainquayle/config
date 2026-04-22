{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ente-auth 
    ente-cli
    #git-crypt
    age
    #_7zz
  ];

  environment.shellAliases = {
    #encrypt-7z = "7zz a -p -mhe=on -t7z";
    #decrypt-7z = "7zz x";
  };
}
