{pkgs, ...}: {
  documentation.dev.enable = true;

  environment.systemPackages = with pkgs; [
    opencode
    claude-code

    jq

    cmake
    gnumake

    gh

    #entr # run commands when files change

    python3
    pyright

    #rustup
    cargo
    rustc
    rust-analyzer
    clippy

    go
    gopls

    gcc
    #clang 
    #libcxx
    #libllvm
    clang-tools # should have clangd and all necessities

    arduino-cli

    elixir
    elixir-ls
    erlang

    nodejs
    #nodePackages.parcel
    #nodePackages.tailwindcss
    #tailwindcss
    typescript
    typescript-language-server

    vscode-langservers-extracted #html, css

    #marksman #markdown lsp

    nil #nix lsp

    #luajit
    lua
    #lua54Packages.luaposix
    lua-language-server

    ruby
    ruby-lsp
  ];

  environment.shellAliases = {
    opencode-authed = "OPENROUTER_API_KEY=$(secret-tool lookup api-key openrouter) CHUTES_API_KEY=$(secret-tool lookup api-key chutes) opencode -c";
    cuda-env = "nix-shell ~/.config/nix/shells/cuda-fhs.nix";
    std-env = "nix-shell ~/.config/nix/shells/std-fhs.nix";
    py-test = "python -m unittest -v";
    count-lines = "find . -type f | xargs wc -l | sort -n";
  };

  environment.sessionVariables = {
    CLAUDE_CONFIG_DIR = "$HOME/.config/claude";
  };
}
