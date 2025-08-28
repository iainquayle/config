{...}: {
  #this is only available on local, can be changed but shouldnt
  #to get local and vpn, run a clear reverse nginx proxy that will bind to the vpn
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    loadModels = [
      "deepseek-r1:14b"
      "qwen3:14b"
      "phi4-reasoning:plus"
    ];
  };
}
