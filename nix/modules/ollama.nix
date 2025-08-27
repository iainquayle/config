{...}: {
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
