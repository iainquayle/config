{...}: {
  services = {
    ollama = {
      enable = true;
      acceleration = "cuda";
      port = 11434;
      loadModels = [
        #"deepseek-r1:14b"
        #"qwen3:14b"
        "gpt-oss:20b"
        #"devstral:24b"
      ];
      environmentVariables = {
        OLLAMA_CONTEXT_LENGTH = "128000";
      };
    };
    #nextjs-ollama-llm-ui.enable = true;
  };
}
