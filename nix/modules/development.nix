{pkgs, ...}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster";
        #theme = "jonathan";
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    cmake
    gnumake
    git
	git-lfs
    gh

    xclip
    alacritty
    tmux
    fzf
    nushell
    xonsh

    python3
    #pyright

    cargo
    #rust-analyzer

    go
    #gopls

    gcc
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

  #services.udev.extraRules = '' KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl" '';
}
