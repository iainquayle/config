# acceleration and port, and maybe context length, and models should be moved to machine specific config
# or maybe create multiple configs?
{...}: {
  services = {
    ollama = {
      enable = true;
      acceleration = "cuda";
      port = 11434;
      loadModels = [
        #"qwen2.5-coder:14b"
        "cogito:14b"
        "gpt-oss:20b"
      ];
      environmentVariables = {
        OLLAMA_CONTEXT_LENGTH = "64000";
      };
    };
    #nextjs-ollama-llm-ui.enable = true;
  };
}
