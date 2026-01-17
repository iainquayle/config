# acceleration and port, and maybe context length, and models should be moved to machine specific config
# or maybe create multiple configs?
{pkgs, ...}: {
  services = {
    ollama = {
      enable = false;
      package = pkgs.ollama-cuda;
      port = 11434;
      loadModels = [
        "gpt-oss:20b"
      ];
      environmentVariables = {
        OLLAMA_CONTEXT_LENGTH = "64000";
      };
    };
    #nextjs-ollama-llm-ui.enable = true;
  };
}
