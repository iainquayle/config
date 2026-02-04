# acceleration and port, and maybe context length, and models should be moved to machine specific config
# or maybe create multiple configs?
{pkgs, ...}: {
  services = {
    ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
      port = 11434;
      loadModels = [
        "glm-4.7-flash:latest"
      ];
      environmentVariables = {
        OLLAMA_CONTEXT_LENGTH = "256000";
      };
    };
    #nextjs-ollama-llm-ui.enable = true;
  };
}
