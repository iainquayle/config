{...}: {
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
