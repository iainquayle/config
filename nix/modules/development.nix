{pkgs, ...}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    nix-ld = {
      enable = true;
#        libraries = with pkgs; [
#          glibc
#          cargo
#      ];
    };
  };

  environment.systemPackages = with pkgs; [
    cmake
    gnumake
    gh

    entr

    python3
    #pyright

    cargo
    rustc
    #rust-analyzer

    go
    #gopls

    gcc
    #llvmPackages_latest.lldb
    #llvmPackages_latest.libllvm
    #llvmPackages_latest.libcxx
    #llvmPackages_latest.clang
    clang 
    libcxx
    libllvm
    clang-tools
    #clangd

    elixir
    #elixir-ls

    erlang

    nodejs
    #typescript

    tectonic
    #texlab

    #nil
    #lua-language-server

    #vial

    #current hack for linking mason lsps, use fhs, cuda works since it has glib and whatnot
    #options in the future:
    #    auto start a fhs in each open shell
    #    or us nix-ld, catches dynamic linking
    #    set an environment variable, and have nvim switch between on machine lsps (nix) and mason lsps (other os)
  ];

  environment.shellAliases = {
    cuda-env = "nix-shell ~/.config/nix/shells/cuda-fhs.nix";
    py-test = "python -m unittest -v";
  };

  environment.sessionVariables = { };

}
