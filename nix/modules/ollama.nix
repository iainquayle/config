{...}: {
  #this is only available on local, can be changed but shouldnt
  #to get local and vpn, run a clear reverse nginx proxy that will bind to the vpn
  services = {
    ollama = {
      enable = true;
      acceleration = "cuda";
      port = 11434;
      loadModels = [
        #"deepseek-r1:14b"
        #"qwen3:14b"
        "mistral-small3.2:24b"
        #"phi4-reasoning:plus"
        "gpt-oss:20b"
        #"devstral:24b"
      ];
    };
    #nextjs-ollama-llm-ui.enable = true;
  };
}
