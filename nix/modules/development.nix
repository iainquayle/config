{pkgs, ...}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    #nix-ld = {
    #  enable = true;
#        libraries = with pkgs; [
#          glibc
#          cargo
#      ];
    #};
    #lazygit.enable = true;
  };

  documentation.dev.enable = true;

  environment.systemPackages = with pkgs; [
    cmake
    gnumake

    gh

    #entr # run commands when files change

    python3
    pyright

    cargo
    rustc
    rust-analyzer

    go
    gopls

    gcc
    #clang 
    #libcxx
    #libllvm
    #clang-tools
    #clangd #errors for some reason?

    elixir
    elixir-ls
    erlang

    nodejs
    #nodePackages.parcel
    #nodePackages.tailwindcss
    #tailwindcss
    typescript
    typescript-language-server

    nil

    luajit
    lua-language-server
  ];

  environment.shellAliases = {
    cuda-env = "nix-shell ~/.config/nix/shells/cuda-fhs.nix";
    std-env = "nix-shell ~/.config/nix/shells/std-fhs.nix";
    py-test = "python -m unittest -v";
    count-lines = "find . -type f | xargs wc -l | sort -n";
  };

  environment.sessionVariables = { };
}
